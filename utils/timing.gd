extends Node

const DELTA_RATIO := 150

func process_delta(delta: float, ratio: float = DELTA_RATIO) -> float:
	return 1.0 - exp(-delta * ratio)

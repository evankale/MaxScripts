/*
 * Copyright (c) 2018 Evan Kale
 * Email: EvanKale91@gmail.com
 * Web: www.youtube.com/EvanKale
 * Social: @EvanKale91
 *
 * This file is part of MaxScripts.
 *
 * MaxScripts is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
-- Decrease grid spacing

macroScript Decrease_Grid_Spacing category:"EKMax"
tooltip:"Decrease Grid Spacing"
(
	if(gridPrefs.spacing > 50)
	then(gridPrefs.spacing= 50)
	else if(gridPrefs.spacing > 20)
	then(gridPrefs.spacing = 20)
	else if(gridPrefs.spacing > 10)
	then(gridPrefs.spacing = 10)
	else if(gridPrefs.spacing > 5)
	then(gridPrefs.spacing = 5)
	else if(gridPrefs.spacing > 2)
	then(gridPrefs.spacing = 2)
	else if(gridPrefs.spacing > 1)
	then(gridPrefs.spacing = 1)
	else if(gridPrefs.spacing > 0.5)
	then(gridPrefs.spacing = 0.5)	
	
	print (gridPrefs.spacing)
)
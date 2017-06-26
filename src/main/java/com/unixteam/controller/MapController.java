package com.unixteam.controller;

import com.unixteam.entity.Map;
import com.unixteam.service.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Вадим on 25.06.2017.
 */
@RestController
public class MapController {

    @Autowired
    MapService markService;

    @RequestMapping(value = "/allmarkers", method = RequestMethod.GET)
    public ModelAndView allMarkers (ModelAndView model) throws SQLException {
//        ModelAndView model = new ModelAndView();
        List<Map> mark = markService.getAllMaps();

        model.addObject("markers", mark);
        model.setViewName("allmarkers");
        return model;
    }
/*	@RequestMapping(value = "/allPaintings", method = RequestMethod.GET)
	public ModelAndView allExhibitions(ModelAndView model, @AuthenticationPrincipal User user) {

		List<Painting> painting = paintingService.getAllPaintings();

		model.addObject("paintings", painting);
		if (user.getRole() == Role.ADMIN) {
			model.setViewName("painting");
		} else {
			model.setViewName("paintingUser");
		}
		return model;
	}*/
}

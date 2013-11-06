From: "David Laight" <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH v3 1/3] phy: Add new Exynos USB PHY driver
Date: Wed, 6 Nov 2013 13:03:45 -0000
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6026B73E7@saturn3.aculab.com>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com> <2656549.jVSier62Qi@amdc1227> <527A3B1C.50200@ti.com> <2413995.ezl3Ca2YTh@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <2413995.ezl3Ca2YTh@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

> > I just did a diff of registers in exynos 4210 and 4212 PHY drivers [1]
> > and couldn't find that big a difference in register layout. Of course
> > there are a few changes in HSIC bit fields and PHYFSEL but that's only
> > minimal and could well be handled in a single driver.
> >
> > [1] -> http://diffchecker.com/py3tp68m
> 
> This is quite a lot of differences, especially including shifted
> bitfields... In addition there is another set of available PHYs
> and inter-dependencies between them.

Might be worth feeding both files through "sed -e 's/_421[02]_/_421x_/'"
prior to doing the diff.
And maybe changing the order of some definitions so they match.
Then the actual differences will be more obvious.

	David



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

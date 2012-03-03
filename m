From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/3] video: s3c-fb: Rearrange the elements in platform
 data
Date: Sat, 3 Mar 2012 16:49:08 +0000
Message-ID: <20120303164908.GD3071@opensource.wolfsonmicro.com>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
 <20120303163000.GA1495@sirena.org.uk>
 <CAJuYYwRnB=6S6DmtMrX-S_LF9ayjFSHT=p5J8S1YyGMZkpaG9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53223 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752618Ab2CCQtL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Mar 2012 11:49:11 -0500
Content-Disposition: inline
In-Reply-To: <CAJuYYwRnB=6S6DmtMrX-S_LF9ayjFSHT=p5J8S1YyGMZkpaG9w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jg1.han@samsung.com, ben-linux@fluff.org, patches@linaro.org


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 03, 2012 at 10:15:32PM +0530, Thomas Abraham wrote:

> The third patch in this series includes platform data updates for the
> Exynos4210 based Origen board. If the first two patches in this series
> are acceptable, I will submit another version of this patchset which
> would include updates to all existing machines that have platform data
> for s3c-fb driver. I did not want to modify all the existing machines
> without being sure of the acceptance of the first two patches.

OK, it'd have been good to highlight that more strongly so that the
patches don't just get applied if they look OK - you did mention it but
it was buried quite far down in the cover letter and would be very easy
to miss.

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPUktFAAoJEBus8iNuMP3dFVEQAJeC2YySx3proYkfMvk+0xmN
8gOXr7FubJpOKV4BrxBkCBhn+Gv7gMv6I2PLupl8Q+FhwaxaItFZXNZrD1ckVl7t
EdFnNE3V2bLHUWERIU29gGBY+7UUDBCQjw0YMy5UB0OnvYn1ooM7rJ5/RNVnzdxS
Tuu3P2Y5ly4kcXf4gv8El1ASsnHlUiQnVVWxMpvE6GYi+dU8g8feqGIfFh5vQbnc
jTaO+uil7KwOzQqRzW54WcfZ3WM5DgiA0et7enKhcYQX06oDOCBsFsX/4Io0b6ZG
qynSvkhJmhwrCijlr5UeDUD4Ur59oosKSLJyzmm+Ea15UOVNnj6PYtfhOcersVVi
YAHMyYq8TktFtxa/6PlEQJGiC0DzfJH0UH5Ak1bb2+w6uUWJ+oC+sLK3cvLO261e
XCJkwi9Xr0Evkfor2BYFVvczjeGqOQDAIIF8AeN4rbHXNNPhAuq07Pnx2Eeuvqs7
6pYOb3OTrET8FLyhavcGtFECNMFD3JBR1HP0/l3CtzSNYOXHkxIKxJP6YCZAQjwo
q2Iv/Y/N2V+DaatzY61NuOFQOhWJUsYZ1rBXxw4LyUo7gQihMzXppqVWOz8/AkEG
XYXnJVz3lxrvKgAf5rUj6y7zPYSzUPK0R1roiEii1794U9/GNw9sH4YAlKbjn0qX
xU4KzotMyMTzuZdyx0ku
=frTt
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--

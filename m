From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: $(make uImage) is stupid [Was: Re: Early kernel hang with big DTB
 appended]
Date: Mon, 14 Jan 2013 09:45:24 +0100
Message-ID: <20130114084524.GN14860@pengutronix.de>
References: <7811936.npteFbuYu2@amdc1227>
 <alpine.LFD.2.02.1301032144490.1263@xanadu.home>
 <35730055.SShm3zF9mO@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:49498 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883Ab3ANIp2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jan 2013 03:45:28 -0500
Content-Disposition: inline
In-Reply-To: <35730055.SShm3zF9mO@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, bones@secretlab.ca, linux-arm-kernel@lists.infradead.org

Hello,

unrelated to the original problem ...

On Fri, Jan 04, 2013 at 11:18:56AM +0100, Tomasz Figa wrote:
> We are using uImages built with same parameters as those used in simp=
le=20
> 'make uImage', just with a DTB appended to zImage before running mkim=
age=20
> on it.
note that the parameters used for $(make uImage) are not optimal, only
safe. They use (letting the MMU aside) the link address of the final
image as load address. That means as U-Boot probably didn't choose the
right address when reading the image it has to move it to the link
address and then jumps into it. Then the decompressor notices that the
compressed image is located where the decompressed image should go to
and so has to move the image again.

So you could save quite some time during boot if you'd teach U-Boot tha=
t
it can just use the image where it was loaded to.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

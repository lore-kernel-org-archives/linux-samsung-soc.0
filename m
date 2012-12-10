From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V4 0/2] Add DT support for i2s
Date: Mon, 10 Dec 2012 23:03:09 +0900
Message-ID: <20121210140306.GA6103@opensource.wolfsonmicro.com>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
 <CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com>
 <20121206041141.GA10867@opensource.wolfsonmicro.com>
 <20121207135131.A53643E0B87@localhost>
 <CAAgF-BenOdFJK2LMot73_B=wHOFgD2sq8x-Ou=1CvpkiJpmeQQ@mail.gmail.com>
 <20121209072607.GD6511@opensource.wolfsonmicro.com>
 <CAAgF-Bd3=W7+kd-uDASva_ofLySvVm1skpLij9WvSyhbfiP5-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34135 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753244Ab2LJODP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Dec 2012 09:03:15 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-Bd3=W7+kd-uDASva_ofLySvVm1skpLij9WvSyhbfiP5-w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

On Mon, Dec 10, 2012 at 04:30:50PM +0530, Padma Venkat wrote:

> Could you please explain me in more detail about "single DT link
> automatically expanded into two DAI links".
> How this can be done?

The device tree should only represent the single physical link that
exists and the handling of the DAIs should be done at runtime by some
piece of software.

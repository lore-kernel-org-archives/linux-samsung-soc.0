From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] mmc: dt: Consolidate DT bindings
Date: Mon, 14 May 2012 19:53:45 +0000
Message-ID: <201205141953.45616.arnd@arndb.de>
References: <1328032576-9269-1-git-send-email-thomas.abraham@linaro.org> <201205131946.33109.arnd@arndb.de> <87pqa7suyk.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:62128 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756803Ab2ENTx6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 15:53:58 -0400
In-Reply-To: <87pqa7suyk.fsf@laptop.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Viresh Kumar <viresh.kumar@st.com>, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-mmc@vger.kernel.org, rob.herring@calxeda.com, Anton Vorontsov <anton.vorontsov@linaro.org>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>

On Sunday 13 May 2012, Chris Ball wrote:
> Hi Arnd,
> 
> On Sun, May 13 2012, Arnd Bergmann wrote:
> > I've verified that there are no conflicts with anything we have in
> > arm-soc right now, so I think it should just go through your
> > tree.
> 
> Ah, I based the patch on latest linux-next.  That's why there aren't
> conflicts against arm-soc, but there are conflicts (in the omap and
> tegra dts changes) between the patch and Linus master/mmc-next:
> 
> Applying: mmc: dt: Consolidate DT bindings
> error: patch failed: arch/arm/boot/dts/omap3-beagle.dts:57
> error: patch failed: arch/arm/boot/dts/omap4-panda.dts:55
> error: patch failed: arch/arm/boot/dts/omap4-sdp.dts:94
> error: patch failed: arch/arm/boot/dts/tegra-cardhu.dts:141
> error: patch failed: arch/arm/boot/dts/tegra-harmony.dts:335
> error: patch failed: arch/arm/boot/dts/tegra-ventana.dts:338
> Patch failed at 0001 mmc: dt: Consolidate DT bindings
> 
> So I think merging via arm-soc is the only way to get it to Linus
> without conflicts.  (Alternatively I can take it in mmc-next and
> Linus can handle the conflicts.)

I've created a drivers/mmc branch with this patch and its direct dependencies
now and pulled that into the next/drivers branch of arm-soc

Thanks,

	Arnd

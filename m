Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8619FC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Feb 2023 10:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjBQKFX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Feb 2023 05:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjBQKFW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 05:05:22 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35362627E6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676628318; x=1708164318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rDRB4V/WoLVz8zYORx7TuyiPxgZ17+/h0wbi/slU0+g=;
  b=GOW3tJ+xg2BJ8Wxmo9My1h9mjPsSYR1Hpkq09oosnq1hmgPYSsK1GzDV
   wGSk2yxSIG6jHQDDIkWLhsLT3pwG6kay9GjvHdD6j7wEryEvH05EWnzgB
   NNXap3wC6Y1RhT7JsGr5O1MUToObKkLdDPfOBh3rAolJVC2nGiWpx46ZF
   /GXWblzOP89thG3/WDEWIzYxjBvM+f2ghY+Inc3g8klicX4TCA0lPIjuF
   2yXjmCREqXrnmQ30IexnEYd4YISEkxOU/0I7vbhcamdxhrjI8ipCNPKsM
   7wIpWtZYlmk9RZxFVGHr3JPqq4Z/LCrrJ1+e+geNrD1w0LjMRfW3evv+8
   A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29152557"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 11:05:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 17 Feb 2023 11:05:16 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 11:05:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676628316; x=1708164316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rDRB4V/WoLVz8zYORx7TuyiPxgZ17+/h0wbi/slU0+g=;
  b=fgu8Srcl2LUVFfApkduI2zcNIoQGJvEV2sdXR2Bg/LtREg4uMnpJJc+O
   gDxCcMtAi+6JKs1wtU9KJEba1x6TqVm1jT59DKHTSl2qfZjAsUDwiLhXt
   E4NM0Tl8WyQl+odIzSw81A3cHXraS4tSoefaNnOXLPyeoo6e9Ssv0nb8E
   IdiK26WLblCmdHlEPc/JNexpHDDnFVuPNRJIJmWkj1ZnQe39j/pK/BfJS
   8REwPLmZcB+0YZ4w0Isx6FDvgToeAkD5d11yYDFwx1ZwHd9FfVJpgtuto
   4iGsncfVNUG7ky/PxWyfShFHER13FE5uNJ1fjE65TXTp9AZAVSfZo7I46
   A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29152556"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Feb 2023 11:05:16 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 120AA280056;
        Fri, 17 Feb 2023 11:05:16 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Fabio Estevam <festevam@gmail.com>,
        dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
        aford173@gmail.com, dri-devel@lists.freedesktop.org,
        sw0312.kim@samsung.com, linux-imx@nxp.com,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        kyungmin.park@samsung.com, Jagan Teki <jagan@amarulasolutions.com>,
        andrzej.hajda@intel.com, m.szyprowski@samsung.com,
        linux-amarula@amarulasolutions.com,
        linux-arm-kernel@lists.infradead.org,
        Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Date:   Fri, 17 Feb 2023 11:05:15 +0100
Message-ID: <9068722.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <25ae1824-4f00-4337-4512-0d8190981fb6@prevas.dk>
References: <20230126144427.607098-1-jagan@amarulasolutions.com> <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com> <25ae1824-4f00-4337-4512-0d8190981fb6@prevas.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Am Freitag, 17. Februar 2023, 09:55:22 CET schrieb Rasmus Villemoes:
> On 14/02/2023 12.09, Fabio Estevam wrote:
> > Hi Rasmus,
> >=20
> > On Tue, Feb 14, 2023 at 7:55 AM Rasmus Villemoes
> >=20
> > <rasmus.villemoes@prevas.dk> wrote:
> >> Well, the data sheet for the dsi86 says up to 750MHz DSI HS clock, and
> >> if the value specified in samsung,burst-clock-frequency is twice the D=
SI
> >> HS clk, I suppose I should be good up to 1.5GHz? I have tried many
> >> different values, but I never seem to get anything through; I think I'm
> >> missing some piece.
> >>=20
> >> So now I've tried to use these patches on the imx8mp-evk with the
> >> mipi->hdmi accessory from NXP, just to see if I can ever get any
> >> graphics through the mipi interface. And there the story is the same:
> >> the adv7535 bridge gets probed, and can read out the edid from the
> >> monitor over hdmi. And while the mipi block and the bridge seem to
> >> attach to each other, I still don't get any output.
> >>=20
> >> Do any of you happen to have this working on the imx8mp-evk, and if so,
> >> can you share the .dts updates you've done and how exactly you test the
> >> graphics?
> >=20
> > I don't have access to an imx8mp-evk, but I tested the ADV7535 MIPI to
> > HDMI daughter card on an imx8mm-evk.
> >=20
> > Some extra ADV7535 patches were needed. Please check patches 0020-0023
> > and see if they help.
>=20
> Thanks, but they don't seem to make a difference.
>=20
> I've started trying to simply compare registers between the NXP 5.15
> kernel and the imx8mm-dsi-v12 branch with Marek's patch on top. Already
> in MEDIA_BLK_CTRL, 0x32ec0000, there's something interesting:
>=20
>  ## Media Mix Clock Enable Register
> -CLK_EN                 0004    0080e133
> +CLK_EN                 0004    00800133
>  ## MIPI PHY Control Register
> -MIPI_RESET_DIV         0008    40030000
> +MIPI_RESET_DIV         0008    00020000
>=20
> So with the NXP kernel, there are three bits set in CLK_EN which are not
> set with the "mainline", but those bits are marked reserved in the RM,
> so I have no idea if they are just some RO bits that get set due to some
> other munging. Then there's the MIPI_RESET_DIV register where bits 16
> and 30 do not get set. Of course, there are lots of other differences,
> but perhaps this gives somebody an idea.

Looking at drivers/soc/imx/imx8m-blk-ctrl.c the bits for MIPI_RESET_DIV are
16: MIPI_CSI1
17: MIPI_DSI
30: MIPI_CSI2
So i think that's okay here.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



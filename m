From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Mon, 18 Sep 2017 17:30:07 -0500
Message-ID: <20170918223007.tfcagib2ml2gbi5d@rob-hp-laptop>
References: <1505201648-9240-1-git-send-email-m.purski@samsung.com>
 <CGME20170912073457eucas1p1333fbdc4f14ee460be38018d3d1379bf@eucas1p1.samsung.com>
 <1505201648-9240-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33151 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbdIRWaK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 18:30:10 -0400
Content-Disposition: inline
In-Reply-To: <1505201648-9240-2-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com

On Tue, Sep 12, 2017 at 09:34:07AM +0200, Maciej Purski wrote:
> SiI9234 transmitter converts eTMDS/HDMI signal to MHL 1.0.
> It is controlled via I2C bus. Its interaction with other
> devices in video pipeline is performed mainly on HW level.
> The only interaction it does on device driver level is
> filtering-out unsupported video modes, it exposes drm_bridge
> interface to perform this operation.
> 
> This patch is based on the code refactored by Tomasz Stanislawski
> <t.stanislaws@samsung.com>, which was initially developed by:
> Adam Hampson <ahampson@sta.samsung.com>
> Erik Gilling <konkers@android.com>
> Shankar Bandal <shankar.b@samsung.com>
> Dharam Kumar <dharam.kr@samsung.com>
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  .../devicetree/bindings/display/bridge/sii9234.txt |  49 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/bridge/Kconfig                     |   8 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/sii9234.c                   | 996 +++++++++++++++++++++
>  4 files changed, 1054 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
>  create mode 100644 drivers/gpu/drm/bridge/sii9234.c

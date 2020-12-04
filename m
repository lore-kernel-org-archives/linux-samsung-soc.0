Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033D5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 10:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4AAC22517
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 10:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729636AbgLDKIV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 05:08:21 -0500
Received: from aposti.net ([89.234.176.197]:35172 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgLDKIV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 05:08:21 -0500
Date:   Fri, 04 Dec 2020 10:07:18 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix
 =?UTF-8?Q?compile=0D=0A?= tests
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Message-Id: <648TKQ.6Y0PFSNHQM1Q3@crapouillou.net>
In-Reply-To: <20201204081819.GA3891@kozik-lap>
References: <20201116175301.402787-1-krzk@kernel.org>
        <20201116175301.402787-2-krzk@kernel.org>
        <3ANWJQ.LV5B6V47KTYS2@crapouillou.net> <20201204081819.GA3891@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Le ven. 4 déc. 2020 à 10:18, Krzysztof Kozlowski <krzk@kernel.org> a 
écrit :
> On Mon, Nov 16, 2020 at 07:54:03PM +0000, Paul Cercueil wrote:
>>  Hi Krzysztof,
>> 
>>  Le lun. 16 nov. 2020 à 18:53, Krzysztof Kozlowski 
>> <krzk@kernel.org> a écrit
>>  :
>>  > The Ingenic DRM uses Common Clock Framework thus it cannot be 
>> built on
>>  > platforms without it (e.g. compile test on MIPS with RALINK and
>>  > SOC_RT305X):
>>  >
>>  >     /usr/bin/mips-linux-gnu-ld:
>>  > drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function
>>  > `ingenic_drm_bind.isra.0':
>>  >     ingenic-drm-drv.c:(.text+0x1600): undefined reference to
>>  > `clk_get_parent'
>>  >     /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0):
>>  > undefined reference to `clk_get_parent'
>>  >
>>  > Reported-by: kernel test robot <lkp@intel.com>
>>  > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> 
>>  Acked-by: Paul Cercueil <paul@crapouillou.net>
> 
> Thanks for the ack.
> 
> David and Daniel,
> I think there is no dedicated maintainer for Ingenic DRM, so can you
> pick it up directly?

I am. Pushed to drm-misc-next, thanks!

-Paul



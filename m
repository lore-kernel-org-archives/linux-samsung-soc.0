Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6585BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 Jan 2022 10:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbiACKSF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 3 Jan 2022 05:18:05 -0500
Received: from 6.mo575.mail-out.ovh.net ([46.105.63.100]:45359 "EHLO
        6.mo575.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiACKSF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jan 2022 05:18:05 -0500
X-Greylist: delayed 1199 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Jan 2022 05:18:05 EST
Received: from player773.ha.ovh.net (unknown [10.109.143.175])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 0A747233D3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Jan 2022 09:41:05 +0000 (UTC)
Received: from etezian.org (82-181-27-157.bb.dnainternet.fi [82.181.27.157])
        (Authenticated sender: andi@etezian.org)
        by player773.ha.ovh.net (Postfix) with ESMTPSA id 4A0D425FD0C77;
        Mon,  3 Jan 2022 09:40:55 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005d8f6c1c1-938a-4caf-be9f-e653b6a788c1,
                    1C8846252225BEA48CFC69899B133A5ED785C568) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 82.181.27.157
Date:   Mon, 3 Jan 2022 11:40:54 +0200
From:   Andi Shyti <andi@etezian.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: exynos: split dmas into array of phandles
 in Exynos5250
Message-ID: <YdLEprsh3i3/oRVb@jack.zhora.eu>
References: <20220102155807.42758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220102155807.42758-1-krzysztof.kozlowski@canonical.com>
X-Ovh-Tracer-Id: 14172828029060975128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefuddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpdekvddrudekuddrvdejrdduheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjeefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Sun, Jan 02, 2022 at 04:58:06PM +0100, Krzysztof Kozlowski wrote:
> "dmas" property should be rather an array of phandles, as dtschema
> points.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi

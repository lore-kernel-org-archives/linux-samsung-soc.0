Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E53C6FD1A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 10:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjCFKXm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 05:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjCFKXi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 05:23:38 -0500
X-Greylist: delayed 4587 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Mar 2023 02:23:28 PST
Received: from 18.mo581.mail-out.ovh.net (18.mo581.mail-out.ovh.net [188.165.56.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17647211CA
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 02:23:27 -0800 (PST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.146.53])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id 142E726247
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 09:06:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jbrfz (unknown [10.110.103.233])
        by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 127281FE8C;
        Mon,  6 Mar 2023 09:06:56 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
        by ghost-submission-6684bf9d7b-jbrfz with ESMTPSA
        id 8aX6LTCtBWR9AgAA58LVJg
        (envelope-from <andi@etezian.org>); Mon, 06 Mar 2023 09:06:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004ac770ce1-db47-4670-b400-4d32ddd5c3e6,
                    E6EC2E320FFEB7B5CA07697FBFAF7FF511F3A6BF) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.173.28
Date:   Mon, 6 Mar 2023 10:06:56 +0100
From:   Andi Shyti <andi@etezian.org>
To:     Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: s3c64xx: add no_cs description
Message-ID: <ZAWtMIDHGd+nBTA1@intel.intel>
References: <CGME20230306015413epcas2p371356e4008af6978cdadb5b859d8be2a@epcas2p3.samsung.com>
 <20230306014239.80570-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306014239.80570-1-jaewon02.kim@samsung.com>
X-Ovh-Tracer-Id: 12480037520701262555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddthedguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnhepjefgleegkeeiffejgeevuedvheegleevteevjeduffevvdelhedvfeelheduleeunecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsrghmshhunhhgqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jaewon,

On Mon, Mar 06, 2023 at 10:42:39AM +0900, Jaewon Kim wrote:
> This patch adds missing variable no_cs descriptions.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi

> ---
>  include/linux/platform_data/spi-s3c64xx.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/platform_data/spi-s3c64xx.h b/include/linux/platform_data/spi-s3c64xx.h
> index 5df1ace6d2c9..3101152ce449 100644
> --- a/include/linux/platform_data/spi-s3c64xx.h
> +++ b/include/linux/platform_data/spi-s3c64xx.h
> @@ -29,6 +29,7 @@ struct s3c64xx_spi_csinfo {
>   * struct s3c64xx_spi_info - SPI Controller defining structure
>   * @src_clk_nr: Clock source index for the CLK_CFG[SPI_CLKSEL] field.
>   * @num_cs: Number of CS this controller emulates.
> + * @no_cs: Used when CS line is not connected.
>   * @cfg_gpio: Configure pins for this SPI controller.
>   */
>  struct s3c64xx_spi_info {
> -- 
> 2.17.1

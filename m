From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: s3c24xx: Add dma_slave_map for s3c2440 devices
Date: Thu, 15 Sep 2016 11:05:12 +0200
Message-ID: <2fa402bf-0e3f-0495-41ca-7a3c89eaa2e1@samsung.com>
References: <CGME20160914183040eucas1p22a61e6b39333cfe1aa9a6b63e74a1bcf@eucas1p2.samsung.com>
 <1473877775-7537-1-git-send-email-sam.van.den.berge@telenet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1473877775-7537-1-git-send-email-sam.van.den.berge@telenet.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Van Den Berge <sam.van.den.berge@telenet.be>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/14/2016 08:29 PM, Sam Van Den Berge wrote:
> +static const struct dma_slave_map s3c2440_dma_slave_map[] = {
...
> +	{ "3c2440-sdi", "rx", (void *)DMACH_SDI },
> +	{ "3c2440-sdi", "tx", (void *)DMACH_SDI },

The device names seem misspelled here, and looking at what
drivers/mmc/host/s3cmci.c driver does we need just a single common
entry for rx and tx

	{ "s3c2440-sdi", "rx-tx", (void *)DMACH_SDI },

With this fixed feel free to add

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester

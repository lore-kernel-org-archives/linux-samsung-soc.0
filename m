From: "krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix system restart support on s3c6410
Date: Mon, 9 Sep 2019 20:55:47 +0200
Message-ID: <20190909185547.GC10091@kozik-lap>
References: <BY5PR12MB3699F7EF4920F878F3096DE7C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <BY5PR12MB3699F7EF4920F878F3096DE7C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yao Lihua <ylhuajnu@outlook.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene@kernel.org" <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Sep 07, 2019 at 03:30:01AM +0000, Yao Lihua wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> S3C6410 system restart is triggered by watchdog reset.
> 
> Fixes: 9f55342cc2de ("ARM: dts: s3c64xx: Fix infinite interrupt in soft mode")
> Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
> ---
>  arch/arm/plat-samsung/watchdog-reset.c | 1 +

Thanks, applied.

Best regards,
Krzysztof

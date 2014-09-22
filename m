From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH v5] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Mon, 22 Sep 2014 09:55:36 +0000
Message-ID: <d986e3e3ea4d410ea3dab7483c89d640@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1411360807-7750-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411360807-7750-1-git-send-email-pankaj.dubey@samsung.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Aisheng.Dong@freescale.com" <Aisheng.Dong@freescale.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "naushad@samsung.com" <naushad@samsung.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "joshi@samsung.com" <joshi@samsung.com>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "vikas.sajjan@samsung.com" <vikas.sajjan@samsung.com>, "chow.kim@samsung.com" <chow.kim@samsung.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

[...]
> +static struct regmap_config syscon_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
>  };
> 
> -static int syscon_match_node(struct device *dev, void *data)
> +static struct syscon *of_syscon_register(struct device_node *np)
>  {
> -	struct device_node *dn = data;
> +	struct platform_device *pdev = NULL;

struct platform_device *pdev; ?

Thanks,

BRs
Xiubo

From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] I2C-S3C2410: Use common error handling code in
 s3c24xx_i2c_probe()
Date: Wed, 25 Oct 2017 16:26:20 +0300
Message-ID: <20171025132620.l7scp2eachnarpzt@mwanda>
References: <32c82282-ee0a-137f-4913-310b194b60f3@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <32c82282-ee0a-137f-4913-310b194b60f3@users.sourceforge.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: SF Markus Elfring <elfring@users.sourceforge.net>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

> @@ -1180,24 +1179,21 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  		i2c->irq = ret = platform_get_irq(pdev, 0);
>  		if (ret <= 0) {

Not related to this patch, but the comparison here should be < 0.  Or
otherwise we should set an error code.  The bug was introduced in commit
e0d1ec97853f ("i2c-s3c2410: Change IRQ to be plain integer.").

>  			dev_err(&pdev->dev, "cannot find IRQ\n");
> -			clk_unprepare(i2c->clk);
> -			return ret;

regards,
dan carpenter

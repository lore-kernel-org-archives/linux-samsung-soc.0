From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 20/29] watchdog: s3c2410_wdt: simplify use of devm_ioremap_resource
Date: Wed, 14 Aug 2013 20:19:44 -0700
Message-ID: <520C48D0.40509@roeck-us.net>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr> <1376471493-22215-21-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376471493-22215-21-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ben Dooks <ben-linux@fluff.org>, kernel-janitors@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Wim Van Sebroeck <wim@iguana.be>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/14/2013 02:11 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
>
> Move the call to platform_get_resource adjacent to the call to
> devm_ioremap_resource to make the connection between them more clear.
>
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression pdev,res,n,e,e1;
> expression ret != 0;
> identifier l;
> @@
>
> - res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>    ... when != res
> - if (res == NULL) { ... \(goto l;\|return ret;\) }
>    ... when != res
> + res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>    e = devm_ioremap_resource(e1, res);
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

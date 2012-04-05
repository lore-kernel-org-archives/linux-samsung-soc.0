From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: fix missing common.h in mach-s3c24xx/
Date: Thu, 05 Apr 2012 08:10:17 -0700
Message-ID: <4F7DB5D9.4080106@samsung.com>
References: <1332980074-4614-1-git-send-email-kgene.kim@samsung.com> <CAP=VYLp-FwEu2AY9wWY7vygmjtZ30AMD=0h8+VtuNVZF2xtTYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLp-FwEu2AY9wWY7vygmjtZ30AMD=0h8+VtuNVZF2xtTYw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/03/12 15:33, Paul Gortmaker wrote:
> Hi,
>
> On Wed, Mar 28, 2012 at 8:14 PM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> This patch fixes missing mach-s3c24xx/common.h which has been
>> lost when regarding s3c24xx directories merged.
>
> Just checking that the updated version of this patch is headed
> in for 3.4 -- we are still seeing the failure in linux-next builds
> and it would be nice to close out the build regressions in there
> as quickly as possible, since they tend to mask other regressions
> from being seen.
>
Hi Paul,

Yeah right and I updated it in my -next.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

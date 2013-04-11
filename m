From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 11/30] [media] exynos: remove unnecessary header inclusions
Date: Thu, 11 Apr 2013 11:07:09 +0200
Message-ID: <51667D3D.20103@samsung.com>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
 <1365638712-1028578-12-git-send-email-arnd@arndb.de>
 <20130410211354.397d5689@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20130410211354.397d5689@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/11/2013 02:13 AM, Mauro Carvalho Chehab wrote:
> Em Thu, 11 Apr 2013 02:04:53 +0200
> Arnd Bergmann <arnd@arndb.de> escreveu:
> 
>> In multiplatform configurations, we cannot include headers
>> provided by only the exynos platform. Fortunately a number
>> of drivers that include those headers do not actually need
>> them, so we can just remove the inclusions.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: linux-media@vger.kernel.org
>> Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>

This patch is already queued in the media tree for 3.10, and it can
be found in -next now.

Thanks,
Sylwester

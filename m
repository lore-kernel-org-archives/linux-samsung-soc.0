From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Thu, 01 Mar 2012 09:47:09 +0530
Message-ID: <4F4EF845.7050803@linaro.org>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
	<1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
	<001701ccf6cc$a83727d0$f8a57770$%han@samsung.com>
	<076b01ccf760$ad072730$07157590$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <076b01ccf760$ad072730$07157590$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On 03/01/2012 09:36 AM, Kukjin Kim wrote:
> Jingoo Han wrote:
>>
>> Hi Tushar,
>>
> 
> (please don't top-post)
> 
>>> -----Original Message-----
>>> From: linux-samsung-soc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-samsung-soc-
>> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf
>>> Of Tushar Behera
>>> Sent: Thursday, December 01, 2011 2:50 PM
>>> To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org;
>> patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
>>> Subject: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
>>>
>>> The framebuffer driver needs the clock named 'lcd' as its bus
>>> clock but the equivalent clock on Exynos4 is named as 'fimd'.
>>> Hence, create a clkdev lookup entry with the name 'lcd' that
>>> references the 'fimd' clock.
>>>
>>> Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
> 
> OK, I will apply this with Sylwester's 'reviewed-by' I looked at  before.
> 
Thanks. Do you want me rebase this patch on your latest for-next and resend?

> BTW, Tushar, what's the [1/3] and [3/3] in this series? If they are still
> needed now, could you please re-send? Maybe I missed.
> 
"[PATCH 1/3] ARM: EXYNOS: Increase DMA pool allocator size for framebuffer"
	- It should be dropped.

"[PATCH 3/3] ARM: EXYNOS: Invert VCLK polarity for framebuffer on Origen
board"
	- It has already been applied.


> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 


-- 
Tushar Behera

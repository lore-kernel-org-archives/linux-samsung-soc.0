From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: fix oops in suspend callback for non-dt
 platforms
Date: Wed, 06 May 2015 06:28:39 +0900
Message-ID: <55493607.3070400@kernel.org>
References: <1430676790-30500-1-git-send-email-anarsoul@gmail.com> <CAJKOXPd71vnup-RZYAh7UM2Tky2M64tA=u0Ydy=ti0yOC6h5aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPd71vnup-RZYAh7UM2Tky2M64tA=u0Ydy=ti0yOC6h5aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/04/15 08:50, Krzysztof Kozlowski wrote:
> 2015-05-04 3:13 GMT+09:00 Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Initialize sysreg by default, otherwise driver will crash in suspend callback.
>>
>> Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> I think the crash is possible if device node is missing in DT or pdata
> is supplied. If you agree, could you add this information to commit
> message, along with Cc-stable and Fixes tag?
> 
> Anyway, the patch itself looks good:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
Can you please add me in Cc in your next posting?

I can't see the patch in my mail box...

- Kukjin

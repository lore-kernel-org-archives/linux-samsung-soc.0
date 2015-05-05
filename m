From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: fix oops in suspend callback for non-dt platforms
Date: Tue, 5 May 2015 10:46:36 +0900
Message-ID: <CAJKOXPd6ED1X9yU-JTTrw8=49S=tQgQ75U5nHrMVhXn3KzVRMw@mail.gmail.com>
References: <1430676790-30500-1-git-send-email-anarsoul@gmail.com>
	<CAJKOXPd71vnup-RZYAh7UM2Tky2M64tA=u0Ydy=ti0yOC6h5aQ@mail.gmail.com>
	<CA+E=qVdjvx=0PSh-ead_pABd9D=bG3ua1FFRTSN2U5BVf2a=Og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+E=qVdjvx=0PSh-ead_pABd9D=bG3ua1FFRTSN2U5BVf2a=Og-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-05 2:52 GMT+09:00 Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Mon, May 4, 2015 at 2:50 AM, Krzysztof Kozlowski
> <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> 2015-05-04 3:13 GMT+09:00 Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> Initialize sysreg by default, otherwise driver will crash in suspend callback.
>>>
>>> Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> I think the crash is possible if device node is missing in DT or pdata
>> is supplied.
>
> And it's exactly the case for non-DT boot, right?

Right, please add this to commit message.

>
>> If you agree, could you add this information to commit
>> message, along with Cc-stable and Fixes tag?
>
> How do I add "Fixes tag"?

In tbe commit message just add below Signed-off-by:
1. Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
2. Fixes: abbreviated SHA ("commit subject")
The SHA of commit which introduced this error. It indicates how far
your patch should be backported.

Look for examples in kernel GIT and
Documentation/stable_kernel_rules.txt. For example:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1c363c7cccf64128087002b0779986ad16aff6dc

Best regards,
Krzysztof

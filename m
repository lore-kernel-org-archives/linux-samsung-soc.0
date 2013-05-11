From: Libo Chen <chenlibo.3@gmail.com>
Subject: Re: [PATCH] usb: gadget: s3c2410: fix clk resource leak and update
Date: Sat, 11 May 2013 19:27:48 +0800
Message-ID: <518E2B34.7080503@gmail.com>
References: <518DE4FF.1000702@gmail.com> <1684189.YrZqmJjoym@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1684189.YrZqmJjoym@flatron>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, balbi@ti.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lizefan@huawei.com, libo.chen@huawei.com, stern@rowland.harvard.edu, akpm@linux-foundation.org
List-Id: linux-samsung-soc@vger.kernel.org

=E4=BA=8E 2013-5-11 18:15, Tomasz Figa =E5=86=99=E9=81=93:
> Hi Libo,
>
> On Saturday 11 of May 2013 14:28:15 Libo Chen wrote:
>> >From: Libo Chen<libo.chen@huawei.com>
> The patch subject is slightly misleading. It suggests that the patch =
only
> changes clock handling, but in fact the biggest part of the patch is
> conversion to devm_ helpers.
>
> I think following subject would suit this patch better:
>
> [PATCH] usb: gadget: s3c2410: Convert to managed resource allocation
>
> What do you think?
>
> Also please see my comments inline.
>

Hi Tomasz,

Thank you for your remind. Sorry, I forgeted to add RFC.

"Convert to managed resource allocation" is more suitable.

Your advice is very helpfull for me to understand those interfaces.
I will be careful in the future patches.

Thanks again

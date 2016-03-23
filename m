From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Wed, 23 Mar 2016 09:08:05 +0800
Message-ID: <56F1EC75.5010903@rock-chips.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>	<1919945.Y1tg0YzXlm@diego>	<56F1CAEB.3080701@samsung.com>	<8949624.HmxDpZAlt2@diego>	<56F1D0AD.8030905@samsung.com>	<20160322233906.GP19428@n2100.arm.linux.org.uk>	<56F1DB27.4040001@samsung.com>	<20160323000835.GQ19428@n2100.arm.linux.org.uk> <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Emil Velikov <emil>
List-Id: linux-samsung-soc@vger.kernel.org

On 2016=E5=B9=B403=E6=9C=8823=E6=97=A5 08:41, Dave Airlie wrote:
>>> So although it's small framework or just subdirectory, we would nee=
d
>>> someone who can manage the framework to avoid further confusion if
>>> necessary.
>> So maybe it just doesn't need a maintainer, and maybe those the owne=
r
>> of the bridge driver should be responsible for choosing the tree whi=
ch
>> it's merged through along with updates.  That's how dw-hdmi has been
>> managed on the whole.
>>
>> It also means that the bridge driver maintainer is able to test chan=
ges
>> to the bridge driver, rather than having some over-arching bridge
>> subdirectory maintainer who doesn't have a clue whether the changes
>> work on the hardware.
>>
>> IMHO, having bridge driver authors/maintainers look after their own
>> code has many advantages.
> The author just send me a pull request with acks from a git tree
> that hopefully both people agreed and tested from. No need to
> send this via another maintainer layer.
>
> Dave.
>
>
>

Sure, these patches looks cool, I think it's ready to be merged, I'd=20
like to give a Acked-by on rockchip side.

--=20
=EF=BC=ADark Yao


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

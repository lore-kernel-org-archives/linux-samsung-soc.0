From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFT PATCH 0/3] usb: misc: usb3503: Fix missing device when TFTP
 booting
Date: Mon, 2 May 2016 15:40:01 +0200
Message-ID: <572758B1.60202@xs4all.nl>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <57247E50.1020000@xs4all.nl> <20160501131746.GA16766@kozik-lap>
 <57260E1E.70205@xs4all.nl> <57262844.7060809@xs4all.nl>
 <20160501164252.GA3581@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160501164252.GA3581@kozik-lap>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/01/16 18:42, Krzysztof Kozlowski wrote:
> On Sun, May 01, 2016 at 06:01:08PM +0200, Hans Verkuil wrote:
>>> Sorry, I meant the hanging issue I got in 4.6, not the ethernet issue.
>>> I get the same problem with linux-next. Can you mail me the .config you are using?
>>
>> Never mind.
>>
>>> After some more testing I don't think it is hanging, instead it seems that the mmc
>>> isn't enabled/found and so it just sits waiting for the root partition to appear.
>>
>> That was fun. There are two problems that both caused the boot to end at the same
>> place: first of all the root partition is now called mmcblk1p1 instead of mmcblk0p1
>> in 4.6, so it was just waiting for the root partition to appear. Nothing to do with
>> your patch series, just unexpected.
> 
> Yes, annoying issue and unfortunately this is known... recommended
> solution is to use root=PARTUUID=xxxx (you can get the PARTUUID with
> blkid)... or replace the mmc device.
> 
>> The second is that enabling CONFIG_VIDEO_S5P_FIMC causes the boot to hang at that
>> same place. I suspect there is a deadlock somewhere. I'm digging deeper into that
>> but again, unrelated to your patch series.
>>
>> Anyway, after disabling that config option I was finally able to test your patch
>> series:
>>
>> Tested-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

BTW, one thing I noticed is that to have u-boot detect the network device I
need to call 'usb reset' twice. This is with u-boot 2016.1 release.

Not a big deal, but I wondered if you see the same.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

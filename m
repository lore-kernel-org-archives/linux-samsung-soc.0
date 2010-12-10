From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC/PATCH v4 0/4] Multi Format Codec 5.0 driver for S5PC110 SoC
Date: Fri, 10 Dec 2010 14:23:24 +0900
Message-ID: <028b01cb982a$601f6630$205e3290$%kim@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
 <026901cb9812$8e28c160$aa7a4420$%kim@samsung.com>
 <AANLkTikP6V47pcvJFyWS9gZHOG90qXDyU4BnQKLWgiJH@mail.gmail.com>
 <028601cb981b$f04035f0$d0c0a1d0$%kim@samsung.com>
 <AANLkTikD7UUHrao9SWsNS1YT9uTM88kH2ugOdKm6yhbS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <AANLkTikD7UUHrao9SWsNS1YT9uTM88kH2ugOdKm6yhbS@mail.gmail.com>
Content-language: ko
Sender: linux-media-owner@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: 'Kamil Debski' <k.debski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, pawel@osciak.com, jaeryul.oh@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> >> >
> >> > Hi Kamil,
> >> >
> >> > I think, should be added my e-mail in Cc...
> >>
> >> No need to cc all, only machine specific only.
> >> and I hope minimal modification at machine specific and move to media
> >> if possible.
> >>
> > Should be reviewed proper maintainer even though it is small changes.
> > Really, I don't want to argue to you about my maintaining ship...
> 
> Each preference is different and you and me are different unfortunately.
> 
Hmm...What's different? If you want to submit something, should be sent to
proper maintainer.
If two maintainers, you need both maintainers' agreement or at least ack to
merge it.

> >
> > And I have a wondering about your sign.
> > Did you really check this patch before Kamil's submitting?
> > Unfortunately, I don't think so...
> 
> I don't care minor issues I'm more focus on the logic.
> 
Maybe you didn't check/review Kamil's patch before submitting.
So your sign has a problem. Please see "Documentation/SubmittingPatches".

I don't think that something like missing GPL license is minor issue.
I mean if you want to add your sign, you had to check it before posting.

And it doesn't matter it's small or big.

> What's the matter mfc or mfc5 and so on? some time later these names
> are changed if new mfc are introduced.
> Currently we're use the mfc version 5.
> 
How about fimc0 or fimc1...it is used as hardware version?
No...it means channel. Why do you use mixed rule?

As I said, if separate hardware version required, we can do it later.

> Do you have any rules on samsung soc variable, module naming? I think
> it depends on each case by case.
> 
Already mentioned.

...

I'd like to stop this here, we already talked about similar issues many
times.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

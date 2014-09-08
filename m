From: Will Deacon <will.deacon@arm.com>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 12:17:30 +0100
Message-ID: <20140908111730.GI26030@arm.com>
References: <20140905115704.GO13515@arm.com>
 <20140905122232.GP13515@arm.com>
 <CAEC9eQOMd7ME5KiG2QHCf3TMJAwSxLUgGpmFrpw_HQT4me9YWg@mail.gmail.com>
 <CAFp+6iF7EbcVqrDKpP4KbYVTEFMD7Jvp9B9kXbAQjpQN3vM=aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:52191 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753238AbaIHLRk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 07:17:40 -0400
Content-Disposition: inline
In-Reply-To: <CAFp+6iF7EbcVqrDKpP4KbYVTEFMD7Jvp9B9kXbAQjpQN3vM=aQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "dianders@chromium.org" <dianders@chromium.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi all,

Sorry for the radio silence, the weekend happened :)

On Fri, Sep 05, 2014 at 02:56:42PM +0100, Vivek Gautam wrote:
> On Fri, Sep 5, 2014 at 7:16 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> >>> I'd usually try to debug this a bit further, but without a console it's
> >>> really painful to get anywhere. I've been working with 3.15, but now I'm
> >>> having to backport patches when I want to test them, which is more effort
> >>> than I can be bothered with.
> >>>
> >>> Is anybody else running mainline on this device and are these known/fixed
> >>> problems?
> > AFAIK, ARM chromebooks use DRM based display drivers and the required
> > patches are still not merged:
> > http://www.spinics.net/lists/dri-devel/msg66740.html
> >
> > Corresponding DT patches are also still not merged:
> > http://www.spinics.net/lists/arm-kernel/msg358324.html
> > http://www.spinics.net/lists/arm-kernel/msg358325.html
> >
> > There is a patch for configs as well:
> > https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35828.html
> >
> > Try these patches(I hope they will apply directly on 3.17-rc3) and you should
> > be able to use display on snow.
> 
> We have pushed 3.17-rc3 kernel with above mentioned patches to github [1]
> Please use that, and in case you have some other requirements let us know.
> 
> [1] https://github.com/exynos-reference/kernel/tree/exynos5-v3.17-rc3-display

I can give these a go but, as Marc has pointed out, things *used* to work
and it's a shame that I need to start carrying patches after vanilla 3.15
was usable.

Will

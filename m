From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Add suspend support
Date: Wed, 06 Oct 2010 01:27:21 +0200
Message-ID: <4CABB459.6070209@gmail.com>
References: <cover.1286319272.git.mcuelenaere@gmail.com>	<1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com> <AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:60967 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757704Ab0JEX1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:27:30 -0400
Received: by eyb6 with SMTP id 6so2666836eyb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:27:29 -0700 (PDT)
In-Reply-To: <AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

 Op 06-10-10 01:23, Kyungmin Park schreef:
> Hi,
>
> I agree your approach, put the common features in common place.
> but Samsung maintainers insist put these at each machine file at current time.
>
> So move this to the each machines for their tastes.
I did it that way first, but then wondered why this wasn't done for all boards.

When looking at some S3C24XX boards, you'll see that these need changes to the
bootloader to support suspend; but IIRC this isn't needed for S3C64XX so I think
this can be safely enabled for all S3C64XX boards?

-- 
Maurus Cuelenaere

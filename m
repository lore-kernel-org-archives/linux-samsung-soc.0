From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Add plat-samsung as starting point for
	plat-s3c* moves
Date: Tue, 10 Nov 2009 12:27:15 +0900
Message-ID: <9c9fda240911091927m46ed0fccyfbbc8873eb9c5da9@mail.gmail.com>
References: <1257812406-17360-1-git-send-email-ben-linux@fluff.org>
	 <000a01ca61a5$c573d000$505b7000$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f192.google.com ([209.85.212.192]:50858 "EHLO
	mail-vw0-f192.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755710AbZKJD1J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Nov 2009 22:27:09 -0500
Received: by vws30 with SMTP id 30so1075974vws.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Nov 2009 19:27:15 -0800 (PST)
In-Reply-To: <000a01ca61a5$c573d000$505b7000$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

On Tue, Nov 10, 2009 at 10:33 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>
> Hi, everyone
>
> On Tue, Nov 10, 2009 at 9:20PM +0900, Ben Dooks wrote:
>
>> We inted to re-organise the plat-s3c/plat-s3c24xx/plat-s3c64xx into a
>> more generic plat-samsung with less code in the other plat- directories
>> to make it easier to port new devices and try and clear up some of the
>> naming issues with newer devices.

Why do you miss the plat-s5pc1xx? Also add the plat-s5pc1xx series.

>>
>> Start by creating a small arch/arm/plat-samsung with no actuall code in
>> so we can move items in as we process them.
> (snip)
>
> Ok, good.
>
> We will be creating plat-s5p following to plat-samsung and will be submitted
> soon.

Why new plat-s5p is required? The main goal of plat-* directory is
support the SoC common codes.
Of course s5pc100 and s5pc110 is different features and different IPs
but no need to create each plat directory.

Thank you,
Kyungmin Park

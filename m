From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Add suspend support
Date: Thu, 07 Oct 2010 00:27:58 +0200
Message-ID: <4CACF7EE.8090605@gmail.com>
References: <cover.1286319272.git.mcuelenaere@gmail.com>	<1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com> <AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com> <4CACF6B8.9030304@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:60329 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757122Ab0JFW2G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 18:28:06 -0400
Received: by ewy23 with SMTP id 23so33292ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2010 15:28:04 -0700 (PDT)
In-Reply-To: <4CACF6B8.9030304@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

 Op 07-10-10 00:22, Ben Dooks schreef:
> I would still prefer each machine that can do pm to call s3c_pm_init()
> in their setup code to ensure that we don't enable pm on a machine with
> possibly incomplete support (especially as PM can be one of the more
> difficult things to debug).

Ok, will resend this with the call only added to mach-smartq.c

-- 
Maurus Cuelenaere

From: christian pellegrin <chripell@gmail.com>
Subject: Re: approaching last call for updatyes
Date: Thu, 13 May 2010 11:37:30 +0200
Message-ID: <AANLkTimHifdCStUZJ_Xgyf2n5mA47Jdj2zscWNB13LDq@mail.gmail.com>
References: <20100513091540.GK26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.158]:44094 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757814Ab0EMJhc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 05:37:32 -0400
Received: by fg-out-1718.google.com with SMTP id 19so2398564fgg.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 May 2010 02:37:31 -0700 (PDT)
In-Reply-To: <20100513091540.GK26401@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The fix for NAND clock stop on idle is missing. Without it I suggest
to mark the option CONFIG_MTD_NAND_S3C2410_CLKSTOP broken.


-- 
Christian Pellegrin, see http://www.evolware.org/chri/
"Real Programmers don't play tennis, or any other sport which requires
you to change clothes. Mountain climbing is OK, and Real Programmers
wear their climbing boots to work in case a mountain should suddenly
spring up in the middle of the computer room."

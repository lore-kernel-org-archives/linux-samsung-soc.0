From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: [PATCH] Re: Endless "supply vcc not found, using dummy regulator"
Date: Wed, 25 May 2016 19:52:36 +0200
Message-ID: <20160525175236.GA5788@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
 <20160524152638.GA20341@sesse.net>
 <574478FE.4070800@samsung.com>
 <20160524192424.GA11690@sesse.net>
 <CANAwSgSS=LPUJ4HXQ_D4tsMYXP=1qG_f_jn-G9xwN6AOKy6QMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:57310 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932527AbcEYRwy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 13:52:54 -0400
Content-Disposition: inline
In-Reply-To: <CANAwSgSS=LPUJ4HXQ_D4tsMYXP=1qG_f_jn-G9xwN6AOKy6QMw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, balbi@kernel.org, linux-usb@vger.kernel.org

On Wed, May 25, 2016 at 05:46:51PM +0530, Anand Moon wrote:
> Actually their are some missing patches to tune the usb3 phy.
> 
> https://lkml.org/lkml/2014/10/31/266

This explains why the default networking speed refused to go above
~300 Mbit/sec! What happened to the patches, I wonder?

/* Steinar */
-- 
Homepage: https://www.sesse.net/

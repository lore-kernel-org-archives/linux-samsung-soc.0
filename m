From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RFC][PATCH 1/4] lcd: platform-lcd: Eliminate need for platform data
Date: Tue, 3 Jan 2012 13:56:58 +0530
Message-ID: <CAJuYYwSAsPYibZsgdHQzMba-wCymRxqqcmtZSZi7A_AzTJv5tg@mail.gmail.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
	<20120102115959.GG2899@opensource.wolfsonmicro.com>
	<CAJuYYwQrfp6R=kSzXr6y0unDk9FtNxoy3Lt5QabdNMg9Qux=bg@mail.gmail.com>
	<20120102181313.GA27875@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:39680 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751992Ab2ACI07 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 03:26:59 -0500
In-Reply-To: <20120102181313.GA27875@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

On 2 January 2012 23:43, Mark Brown <broonie@opensource.wolfsonmicro.co=
m> wrote:
> On Mon, Jan 02, 2012 at 11:21:46PM +0530, Thomas Abraham wrote:
>
>> Your point on maintaining support for both old and new formats is
>> helpful. But I am not sure if maintaining support for both formats i=
s
>> the right thing to do. As most of the ARM platforms will switch to
>> using dt, maybe converting all of them to new format would be better=
=2E
>> I will try doing this and prepare a patch.
>
> There's more architectures than ARM supported in Linux and only a
> minority of them are using device tree at the minute. =A0Unless every
> architecture switches over platform data based users will still need =
to
> be supported.

I will try to retain the old platform data style also since there are
support for lcd panels in mainline that use 2 or more gpios in a panel
specific way. And it would be difficult to fold them into a generic
lcd type for lcd power control.

Thanks,
Thomas.

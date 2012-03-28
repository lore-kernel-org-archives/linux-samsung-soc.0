From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: Samsung: Make PM_GENERIC_DOMAINS config depend on CONFIG_PM
Date: Wed, 28 Mar 2012 17:07:03 +0530
Message-ID: <CAJuYYwRR6eo8LruyOtyi3Sp96jydRvPFhMnbF6wfk55eM-zjbw@mail.gmail.com>
References: <1332843404-25476-1-git-send-email-thomas.ab@samsung.com>
	<20120328105122.GF3232@opensource.wolfsonmicro.com>
	<CAJuYYwQgZqN6nguddjS6bjLhx_ZhUZ5AfcrSAKBa7Ft-Bn6wPQ@mail.gmail.com>
	<20120328113419.GM3232@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:37155 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932285Ab2C1LhF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 07:37:05 -0400
Received: by vbbff1 with SMTP id ff1so616458vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 04:37:04 -0700 (PDT)
In-Reply-To: <20120328113419.GM3232@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On 28 March 2012 17:04, Mark Brown <broonie@opensource.wolfsonmicro.com=
> wrote:
> On Wed, Mar 28, 2012 at 04:51:32PM +0530, Thomas Abraham wrote:
>> On 28 March 2012 16:21, Mark Brown <broonie@opensource.wolfsonmicro.=
com> wrote:
>
>> > What's the underlying issue here? =A0This seems like something the=
 PM core
>> > should be dealing with gracefully...
>
>> The PM_GENERIC_DOMAINS config option has dependency on CONFIG_PM
>> option. When building with PM disabled, the following errors occur.
>
> Right, this does seem like something which it'd be better to handle
> more gracefully in the PM core.

Ok. Selecting PM_GENERIC_DOMAINS without checking for dependency on PM
did not seem correct.

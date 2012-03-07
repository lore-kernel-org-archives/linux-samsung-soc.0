From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] fix to use static declarations for samsung stuff
Date: Wed, 7 Mar 2012 14:49:19 -0800
Message-ID: <CAOesGMgDkWmwVxBRnoOzX-u8FhmXgS_MuLwAigDmGpnXEPwciw@mail.gmail.com>
References: <013b01cce7f3$48c87e30$da597a90$%kim@samsung.com>
	<4F574CAE.6030903@samsung.com>
	<201203071215.57828.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:46594 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965026Ab2CGWtU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 17:49:20 -0500
Received: by wibhm2 with SMTP id hm2so3718376wib.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 14:49:19 -0800 (PST)
In-Reply-To: <201203071215.57828.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, rmk+kernel@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wed, Mar 7, 2012 at 4:15 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 07 March 2012, Kukjin Kim wrote:
>> im wrote:
>> > Hi Russell, Arnd and Olof,
>> >
>> > Please pull following branch which is including fix to use static
>> > declarations for samsung stuff.
>> > =A0 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-sams=
ung.git
>> > next/cleanup-use-static
>> >
>> > I'm not sure it can be sent to upstream for v3.3 but if so, would =
be better.
>> >
>> Hi Arnd, Olof,
>>
>> I can't see this series in arm-soc yet. If missed, please pull from:
>> =A0 http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsu=
ng.git
>> next/cleanup-use-static
>>
>> As a note, I rebased it on top of arm-soc/depends/rmk/for-armsoc bec=
ause
>> this touches same points(dma declaration part).
>>
>> If any problems, please kindly let me know.
>>
>
> Sorry, I must have missed this request, I can't remember seeing it be=
fore.
> The patches all look good, Olof will take care of getting them in.

Yep, pulled now. Apologies for missing it earlier.


-Olof

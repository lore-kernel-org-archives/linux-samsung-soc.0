From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/3] video: s3c-fb: Rearrange the elements in platform data
Date: Sat, 3 Mar 2012 22:15:32 +0530
Message-ID: <CAJuYYwRnB=6S6DmtMrX-S_LF9ayjFSHT=p5J8S1YyGMZkpaG9w@mail.gmail.com>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
	<20120303163000.GA1495@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:39686 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753298Ab2CCQpc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Mar 2012 11:45:32 -0500
Received: by vbbff1 with SMTP id ff1so2349684vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Mar 2012 08:45:32 -0800 (PST)
In-Reply-To: <20120303163000.GA1495@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jg1.han@samsung.com, ben-linux@fluff.org, patches@linaro.org

On 3 March 2012 22:00, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> On Sat, Mar 03, 2012 at 09:20:05PM +0530, Thomas Abraham wrote:
>> This patchset rearranges the elements in the platform data of the s3c-fb
>> driver with the intent of adding device tree support to the driver in
>> subsequent patches.
>
> It seems somewhat surprising that none of these updates touch any
> platform data for any existing machines - are no machines using any of
> the features being updated?

The third patch in this series includes platform data updates for the
Exynos4210 based Origen board. If the first two patches in this series
are acceptable, I will submit another version of this patchset which
would include updates to all existing machines that have platform data
for s3c-fb driver. I did not want to modify all the existing machines
without being sure of the acceptance of the first two patches.

Thanks,
Thomas.

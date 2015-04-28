From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: ARCH_EXYNOS5433 missing in Kconfig
Date: Tue, 28 Apr 2015 11:58:36 +0200
Message-ID: <553F59CC.7040008@samsung.com>
References: <CAD3Xx4Jf5ACBKe-KvGRD=myHKrJ+K_P0vBrtrmfgh+1zNM4hug@mail.gmail.com>
 <54FF95ED.1040003@samsung.com>
 <CAD3Xx4KpTTqNiFA-8EfuPsCR5ow0JkNVo11zM1twkrf8sckJtA@mail.gmail.com>
 <CAGTfZH2yttvRsHXZUXQ7t37wmU=seg8Qoa=h=nat4EwJDY42Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:26035 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933049AbbD1J7H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Apr 2015 05:59:07 -0400
In-reply-to: <CAGTfZH2yttvRsHXZUXQ7t37wmU=seg8Qoa=h=nat4EwJDY42Kw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cw00.choi@samsung.com
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Inki Dae <inki.dae@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>

Hello,

On 28/04/15 11:25, Chanwoo Choi wrote:
> Hi Valentin,
> 
> On Mon, Apr 27, 2015 at 3:31 PM, Valentin Rothberg
> <valentinrothberg@gmail.com> wrote:
>> > Hi Chanwoo,
>> >
>> > this is a kind reminder that the issue mentioned below is still
>> > present and made its way to v4.1-rc1.
>
> I sent the patch[1] to fix it. And Sylwester said that he will pick
> this patchset on patch[2].
> [1] https://lkml.org/lkml/2015/4/27/237
> [2] https://lkml.org/lkml/2015/4/28/117
> 
> Hi Sylwester,
> Could you apply a patch[1] on 4.2-rc2 to fix build warning?

Sure, I plan to send a pull request this week.

-- 
Regards,
Sylwester

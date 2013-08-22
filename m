From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [RFC PATCH 2/3] clk: update users of "clk_register_mux" and
 "DEFINE_CLK_MUX"
Date: Wed, 21 Aug 2013 23:19:30 -0700
Message-ID: <20130822061930.8231.89917@quantum>
References: <1375778065-21808-1-git-send-email-chander.kashyap@linaro.org>
 <1375778065-21808-3-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:38975 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162Ab3HVGTd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 02:19:33 -0400
Received: by mail-pa0-f52.google.com with SMTP id kq13so1749661pab.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2013 23:19:33 -0700 (PDT)
In-Reply-To: <1375778065-21808-3-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, Chander Kashyap <chander.kashyap@linaro.org>

Quoting Chander Kashyap (2013-08-06 01:34:24)
> As with the patch "clk-add-support-for-temporary-parent-clock-migration.patch"
> a new field "alternate_parent_name", is added to clk structure. This field can
> be passed using clk_register_mux API and DEFINE_CLK_MUX macro.

Nitpick: it's easier to search for the patch you mentioned if you quote
the actual patch $SUBJECT instead of the name of the patch file. In this
case, "clk: add support for temporary parent clock migration".

This invasive change is not necessary if the temporary parent stuff is
not added to the clock core and is instead left to the .set_parent
callbacks of custom clock providers.

Regards,
Mike

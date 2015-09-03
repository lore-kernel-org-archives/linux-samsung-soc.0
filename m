From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Thu, 3 Sep 2015 16:55:59 -0500
Message-ID: <CAL_Jsq+F=eE6vU3f-bHrrSCD9GCoh80Nf-5=Qm73QgGDW1Np=w@mail.gmail.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com> <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <20150903084735.GB3784@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:36383 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751505AbbICV4T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 17:56:19 -0400
In-Reply-To: <20150903084735.GB3784@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.freedesktop.>

On Thu, Sep 3, 2015 at 3:47 AM, Thierry Reding <treding@nvidia.com> wrote:
> On Wed, Sep 02, 2015 at 03:17:57PM -0500, Rob Herring wrote:
> [...]
>> Are there any eDP panels which don't have EDID and need panel details in DT?
>
> Most panels need information other than EDID. They typically have some
> requirements regarding the power up sequence that aren't to be found
> anywhere in EDID or detectable by some other mechanism. A decision was
> therefore made a long time ago to require panels to be listed in DT with
> a specific compatible string. That way all of these details can be
> stashed away in drivers that know how to deal with these kinds of
> details.

I guess I was being hopeful that eDP was improving that situation.

Rob

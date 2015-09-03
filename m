From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 01/16] drm: exynos/dp: fix code style
Date: Wed, 02 Sep 2015 22:57:58 -0700
Message-ID: <1441259878.12163.75.camel@perches.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
	 <1441086399-24889-1-git-send-email-ykk@rock-chips.com>
	 <55E79297.3050203@samsung.com> <55E7D4E4.6070808@rock-chips.com>
	 <55E7D5EB.1060505@samsung.com> <55E7DBA7.90504@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0056.hostedemail.com ([216.40.44.56]:42797 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750820AbbICF6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 01:58:05 -0400
In-Reply-To: <55E7DBA7.90504@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.o

On Thu, 2015-09-03 at 13:33 +0800, Yakir Yang wrote:
[]
> >>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
[]
> >>>> @@ -155,24 +156,22 @@ static int exynos_dp_read_edid(struct
> >>>> exynos_dp_device *dp)
> >>>>            }
> >>>>              exynos_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
> >>>> -                    &test_vector);
> >>>> +                          &test_vector);
> >>>>            if (test_vector & DP_TEST_LINK_EDID_READ) {
> >>>> -            exynos_dp_write_byte_to_dpcd(dp,
> >>>> -                DP_TEST_EDID_CHECKSUM,
> >>>> +            exynos_dp_write_byte_to_dpcd(
> >>>> +                dp, DP_TEST_EDID_CHECKSUM,
> >>>>                    edid[EDID_BLOCK_LENGTH + EDID_CHECKSUM]);
> >>>> -            exynos_dp_write_byte_to_dpcd(dp,
> >>>> -                DP_TEST_RESPONSE,
> >>>> +            exynos_dp_write_byte_to_dpcd(
> >>>> +                dp, DP_TEST_RESPONSE,
> >>>>                    DP_TEST_EDID_CHECKSUM_WRITE);
> >>> To me, missing argument after opening parenthesis, looks worse. I would
> >>> prefer:
> >>>
> >>>              exynos_dp_write_byte_to_dpcd(dp,
> >>>
> >>> Why you moved the 'dp' argument to new line?
> >> Hmm... Just like style tool indicate, no more warning after
> >> that change.
> >>
> >> For now, I would like to follow the original style, just improved
> >> some obvious style problem.  :-)
> > What was the checkpatch warning that said 'dp' has to move to new line?
> > I tried this and I don't see it.
> 
> checkpatch haven't remind me that put dp to new line would fix
> this warning, this just come from my experiments. And I works,
> no more warnings from checkpatch, so I toke this style.

Checkpatch isn't a great arbiter of style.
It's just a brainless tool.

Always use your instead of anything brainless.

If it were code I was writing, I'd ignore 80 columns warnings
where appropriate.

These are long function names and long macro defines, so it's
inappropriate to use 80 columns as a guiding style.

I'd write:

		exynos_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST, &test_vector);
		if (test_vector & DP_TEST_LINK_EDID_READ) {
			exynos_dp_write_byte_to_dpcd(dp, DP_TEST_EDID_CHECKSUM,
						     edid[EDID_BLOCK_LENGTH + EDID_CHECKSUM]);
			exynos_dp_write_byte_to_dpcd(dp, DP_TEST_RESPONSE,
						     DP_TEST_EDID_CHECKSUM_WRITE);
		}

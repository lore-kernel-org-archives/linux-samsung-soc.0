From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/5] regulator: of: Add regulator-initial-mode parse support
Date: Wed, 08 Oct 2014 16:38:53 +0200
Message-ID: <54354C7D.7090104@collabora.co.uk>
References: <1412775847-15213-1-git-send-email-javier.martinez@collabora.co.uk> <1412775847-15213-2-git-send-email-javier.martinez@collabora.co.uk> <20141008142511.GA4609@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:52514 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751280AbaJHOjA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 10:39:00 -0400
In-Reply-To: <20141008142511.GA4609@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hello Mark,

Thanks for the feedback.

On 10/08/2014 04:25 PM, Mark Brown wrote:
> On Wed, Oct 08, 2014 at 03:44:03PM +0200, Javier Martinez Canillas wrote:
> 
>> But currently there isn't a way to do the same with DeviceTrees. Argubly
>> the operating modes are Linux-specific so that information should not be
>> in the DT which should be used to only describe hardware. But regulators
>> having different operating modes is also a hardware property since many
>> PMICs have support to set different modes for their regulators.
> 
> That doesn't mean that the definition of those modes is something we can
> sensibly provide in generic code, especially in a completely
> undocumented fashion (perhaps you've done that later in the patch series
> but bisection also applies to reviewability).
> 

Yes, patch #3 updates the regulator DT binding doc and documents what each
regulator mode is supposed to be. Basically is just a short description of
what is already documented in linux/regulator/consumer.h [0].

If what is enough for you I can reorganize the patch-set so that patch is
the first one.

As a general question, now that the convention is for DT binding docs to go
in a separate patch, should the DT documentation be added before or after
that code using these bindings is added?

That is something that is not explained in
Documentation/devicetree/bindings/submitting-patches.txt.

Best regards,
Javier

[0]: http://lxr.free-electrons.com/source/include/linux/regulator/consumer.h#L40

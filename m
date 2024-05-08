Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5222071;
	Wed,  8 May 2024 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715172737; cv=none; b=bGQXyb20QIEO2wd1nJE4KXbtEFWj3WpdbCZvFleSdiqbtDSsDC9PPdZRfvU9Vgi4k3uIE7LDE5hZ5Em1cs3+sjO+2JuhKKjwNVPbscKbbkTQwJDXAYXdXATx5pZGV2w6aUgGVrUG6GZim7dnRhUl+G3s+PGga659A9yZowg1Ej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715172737; c=relaxed/simple;
	bh=gKVeUXfF3Ho2Ed/J5T0T6Hm5ka9z6vCma7xttwCG1nk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=PBDsW1JafR0jaCv7jR/dQjLNx/0gX91x73WWWrKLxjgUPuR8FfgJWDMuYTBsrKYciImkzqlnKkuivn9df/e3KOuJb57oq+1H53g1va8jZYKpw6B0qQrMXKpA0zfK5vW3zxmNAYl5S+1JdNsKpyg6Sz+U4kin8Jh4aKrWFIxG0wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrLk9kfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrLk9kfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F67CC113CC;
	Wed,  8 May 2024 12:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715172736;
	bh=gKVeUXfF3Ho2Ed/J5T0T6Hm5ka9z6vCma7xttwCG1nk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZrLk9kfTvdSk83ynbdqCIsg3st29lqtv/1sbYd9zMlbJIpR4kz4maM4bvCc7bhE6o
	 yeicwe6Lpe564y7ZeTXYSLQ51IQiSSW6S58nizMsqt4fhTcbYbrz9oSh5jnQnsLR98
	 y931YLg6R1Ue4LfhfurZjJByaIrDXAfJ1nNHI25RxtqX10yYg+hyCmxTQ044mJ95cQ
	 BJscpF/cQ2kK6GpAtC24TBHrXSBgMEXPptoXeyuP87wtgDwxMyEr5SPdO51/hPMPW3
	 IbFXQNFkPg2LMoFzyVXpN3PW2HKrAafh5ByHt/Rm86AsDKEYJWCokE7W0PqxVp3L/Q
	 iq/BrU0R0khYg==
Date: Wed, 08 May 2024 07:52:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, ~postmarketos/upstreaming@lists.sr.ht, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 alsa-devel@alsa-project.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-2-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
 <20240508-midas-wm1811-gpio-jack-v2-2-b4d36cd02c6e@gmail.com>
Message-Id: <171517273028.1398305.2447515495565580200.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection


On Wed, 08 May 2024 12:58:50 +0200, Artur Weber wrote:
> Some Samsung devices that share the midas-audio driver use a GPIO-based
> approach to headset jack detection, as opposed to using the built-in
> jack detection provided by the wm8994 driver. This setup uses two GPIOs
> (one for jack detection and another for key detection) and an ADC
> channel for determining the jack type or button pressed.
> 
> Add DT configuration values that allow for describing these setups.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v2:
> - Added vendor prefix to threshold properties
> - Dropped pipe (|) character from description: field
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml:95:26: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/sound/samsung,midas-audio.example.dts'
Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml:95:26: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/samsung,midas-audio.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml:95:26: mapping values are not allowed in this context
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240508-midas-wm1811-gpio-jack-v2-2-b4d36cd02c6e@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


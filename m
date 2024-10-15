Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DF91DE2C0;
	Tue, 15 Oct 2024 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982993; cv=none; b=l3DiI4lrnpdOkbPf3eabH/ywe2uFTsuG0QOdcKEAAoBYynz99xFzaAQw1xteomjW78ifurC05XBiYKL0XQVAhrgt1+jdqtViWQLhYlaiEkMc045xu74NBmvKst2Eh8LR+efqgS2DBqykn4QOKFj6eX+lAJsFj0Jpil9NpEr/9sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982993; c=relaxed/simple;
	bh=I8EgceGKq0kuoqB8rUvXnfOYOa5rhiMU69cDp+diTww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs0o+MgRebu9Xa2hvSAc+VADmK3OubuA1IIn2KC3DJ132IaTUSwnfL4N6U0T96dd9EJWqve0orxp6VspqfYejU495mopcu2EDX7P1AbAUA4vnGBYqbrHRhijjBA2CY2RdPhXpm111jTJ8penXX1+JC8B5n1LJWMCUMWbTCWQCds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0XGuKRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0XGuKRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D65BC4CEC6;
	Tue, 15 Oct 2024 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982993;
	bh=I8EgceGKq0kuoqB8rUvXnfOYOa5rhiMU69cDp+diTww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0XGuKRab7Ngrru0ZGkccQejmFmsBexcL5IB/IW7gX+5yqoxLBPuBRg9g/M0JbnTQ
	 j0B8TOe2kHbIf8j0yOe6RNOWFzaSiTwP6GD4UIxR1p2xLuaouKWWBw70ZQmVpW+Thf
	 84EzJfVk6jpw70nHPUbzy7N6Kd0S748mDleCf+T0o1YtD2KWx9ZNyq40QoJdBIiMZK
	 Yh9uByjT0DpBPXhmPmHQUDt0AUv+zkPANZN/IcEeZXvajTOuT1vVF/orr5iS5cQWc1
	 5nh8CJqZ3CjNU7+H9Vi4z9tyDej9hmhteLeXyqRJp5PvE66RtcUpCTBWBx1E2Bx2/s
	 Jd/sJyPNqwaKg==
Date: Tue, 15 Oct 2024 10:03:08 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] regulator: add s2dos05 regulator support
Message-ID: <20241015090308.GE8348@google.com>
References: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
 <20241007-starqltechn_integration_upstream-v6-3-264309aa66de@gmail.com>
 <ZwP2jpgdESV1XJ5D@finisterre.sirena.org.uk>
 <20241009143116.GK276481@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009143116.GK276481@google.com>

On Wed, 09 Oct 2024, Lee Jones wrote:

> On Mon, 07 Oct 2024, Mark Brown wrote:
> 
> > On Mon, Oct 07, 2024 at 05:50:01PM +0300, Dzmitry Sankouski wrote:
> > > S2DOS05 has 1 buck and 4 LDO regulators, used for powering
> > > panel/touchscreen.
> > 
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> I think you can merge this.

I didn't mean the whole set. *facepalm*

-- 
Lee Jones [李琼斯]

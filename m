Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D262EFDBB;
	Mon,  3 Nov 2025 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162903; cv=none; b=fMwTj7AAL3eCn+Lh4Qc9NZKubRd9FvFv50MSGswyI8GhNw+MSg8LIO4IzkDh1eyE/XI89T/cqlG6KMho28KUCVpM6qaXsaMhpTMBuG6qCEtkUsUSBmeSweu+JUrvSVu6Lg6mb0fF9OsLHTZ++oOwObzYi6OLOS7UiXd5C/+Eg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162903; c=relaxed/simple;
	bh=8gK5j7Hv3paRWGmWznTyKoeIXmyc+VmCy3aM/L3TTSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3hLzYC/+h6be9FBecrs0V6Z8w/VKIvVcE9/1cjeeFFgpNLT1ztzEsd5b8cfv3ZIgNcCWV8degjhFiRMLHa+IuOQ7vJeGGFben4+0IYTx5O17DEym3uJDIuA+ewcTLbzEUR9FL/e9m/r1yIBBA7+PlmC4uX/zSivj65hsJXxri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mN+kLgdN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mN+kLgdN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28452C4CEE7;
	Mon,  3 Nov 2025 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762162902;
	bh=8gK5j7Hv3paRWGmWznTyKoeIXmyc+VmCy3aM/L3TTSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mN+kLgdN/IlFgRwDuxyePznZM9KxTK4XQxaS7KEnQUWbLGJDBLYHYQcWjZicvIXwT
	 MrAQ1Xtj/qvXNDRqIZ2WSvasOL/rcevsH73NgmCEJrcCG0WflgNX4n3G9duyJ9huv6
	 OjnPYEjd52FLmf62HUYuhp3ss5EDEaXORmSQq1fa5kOMkVoSA0k1+LZ3+Jp9aNRDsO
	 fSjG57EhkEW2wCG54zGxNcjhf2le/DRUc0w7evopDQjRy9i4gVNla5yBIStGbndJ+H
	 eLe6sduFPAwDxfkw9XdhhDEoQCn4EZxA07EH39rBXlF5QUISp+LYmrTzWYV8sZGvGg
	 d+rUtEOvIVy6Q==
Date: Mon, 3 Nov 2025 10:41:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>

On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> 
> If present these registers need to be initialised 


... for what exactly? What would happen if this was not initialized?
What is the exact justification for ABI break - wasn't this working
before? Or new feature will not work (thus no ABI break allowed)?

You need to provide rationale and "driver needs to do something" is not
enough, because everything could be justified that way.

> in the clock driver.
> Update the bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
> 
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for auto clock mode.

Best regards,
Krzysztof


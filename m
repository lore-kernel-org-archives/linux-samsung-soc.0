Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337E30F818;
	Tue,  2 Dec 2025 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668565; cv=none; b=sBLhUPYZQFtrnH5sBcNWA7Q5O+0vTWXynVQ4VaIrwsgvWvttbcfpJv/Ef4hI2MAz6LpvtdZ9bRvO2yF1Rcc5oczsoPbd8PMEodFkgHMUpoEVYRhlVMf3RSNK3zl7PFMWeVa3fGby9GPltIWq3K6CUFT473QuxlLdJUlGYwi1PBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668565; c=relaxed/simple;
	bh=0vFwPwr69dUxB+23zt64JFqnHSS+DXXyYRo5msdrQgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLM2ZjoZ9NDTaOGLkSiEgPjO2Kf5UQXhVmHaDGYzFvas7G4xCCTFb08xEvHDQbVMC4nXmShP+fJIK0u4W9GrZLgPeRjvXgFiUe0NZFIhJIPp0OjEjpxF+tkvWosw1zOBEQDd51D9mpLp7BTc2inR2xCQ7kgmRA4NXYl0ZhMlHN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwp4JlLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwp4JlLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B31C4CEF1;
	Tue,  2 Dec 2025 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764668564;
	bh=0vFwPwr69dUxB+23zt64JFqnHSS+DXXyYRo5msdrQgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwp4JlLMt6908s+AwuLH5sT3eeeu1kUsiDY2VppF9E39AKhrdGlVYNT6OpCgTTvnp
	 0C7lXHnFoW6M9dwa620esR8oWLKfhfn1bWeN9aptq4Cg26JDxEW1F0xE/57hNqY1dc
	 IRinLqE6nTFeAocBmTZBB8MNM7O1RFxmcChHqwUWBRM49UMj9cl2LSjntb3yUj4sUX
	 gp9700panjvIva1xnSgeBScnMWnTxffdTkxGfPyUqeQrhAViyN5XOt89YcsOxfI72S
	 PkAdoTUHY0pRH1UiYE7poiDTVPhEX1WbXtm0XyGjoshi5WCvkMij2uiokVBHo64638
	 zwU6pBJ0weIww==
Message-ID: <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
Date: Tue, 2 Dec 2025 10:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com>
 <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
 <2025120209-unstylish-john-2a6c@gregkh>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2025120209-unstylish-john-2a6c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2025 10:27, Greg Kroah-Hartman wrote:
>>>         depends on (OF && COMMON_CLK && RESET_CONTROLLER) || COMPILE_TEST
>>>
>>> I shouldn't have to enable those options to just get a build test here,
>>> the apis should be properly stubbed out if those options are not
>>> enabled, right?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hi Greg,
>>
>> I agree with your interpretation of COMPILE_TEST but it doesn't
>> seem to align with upstream convention. I found the following pattern
>> in several device driver Kconfig files (including but not limited to usb,
>> pinctrl and phy).
>>
>>     depends on COMPILE_TEST || ARCH_XXX
>>     depends on CONFIG_A && CONFIG_B...
>>
>> For this patch, the APIs exposed by OF, COMMON_CLK
>> and RESET_CONTROLLER are properly stubbed out so
>> I'm all good to go with your suggestion, but I'd like to make
>> sure this approach is conventional.
> 
> Whatever works for building properly, as-is, what you have in this patch
> didn't work for my systems at all.
> 
>> I plan to add ARCH_GOOGLE as a dependency in the next
>> version per [1], so the "depends on" would probably look like
>> the following per your suggestion:
> 
> But "Google" is not an arch :(
> 
> And really, the whole "only have a sub-arch symbol" is something that
> personally, I think is totally wrong and prevents kernel images from
> being built for more than one "arch".  As an example, the Android GKI

Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
case. ARCH_FOO in this context is SoC platform, so e.g.
arch/arm64/boot/dts/FOO/.

All of ARCH_FOO build into one image and that's recommended way to limit
unnecessary drivers.

It's just confusing naming for whatever reason.

> kernel has to support more than one of these, so what does putting this
> behind a symbol that no one will actually use mean anything?  Android
> will never be only building a ARCH_GOOGLE kernel.

But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more.

We had this talk in the past. The point is that these drivers here are
unusable outside of that hardware platform, so only when you choose
hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be able
to choose these drivers.

You can also look at ARCH_FOO a bit orthogonal to actual kernel
architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. The
drivers should be available for all Exynos-platforms, regardless whether
this is arm32 or arm64.

> 
>>     depends on (OF && COMMON_CLK && RESET_CONTROLLER && ARCH_GOOGLE)
>> || COMPILE_TEST
>>
>> Please let me know your thoughts.
>> [1] https://lore.kernel.org/linux-phy/1a53d473-fc13-4ac5-ba52-4701d95e3073@kernel.org/
> 
> Again, I hate the ARCH_ stuff, but Krzysztof does seem to like it for
> some reason, so I'll defer to others here.  But note, as someone who
> helps maintain a "generic" ARM64 kernel, these ARCH_* usages for
> different platforms do nothing at all to help anyone out.

True and that's not their goal. The truly generic kernels, like you
mentioned or arch/arm64/configs/defconfig, build everything for arm64.
The entire point is to limit this for actual users wanting much smaller
kernels and distros, which do not need these on for example RISC-V.


Best regards,
Krzysztof

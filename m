Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF29470EAC;
	Sun, 20 Sep 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924149; cv=none; b=hg19maFFs/9uo62mxM6vuPyjGhgbzbNGdU7I2TfW2DM6r60r6tBKiwoRp/ejDgo7zGSg4idWXNY70e1JqqOP6DNwWEn+e5I9v10/n1xZ4CmGicxZx92TsejfeUGWebr6rrPW2aFN6tEERvCanRSqNbgOeEe5ki9Rj13NDZBUMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924149; c=relaxed/simple;
	bh=XxY58653qXLMCdmP/Wl/hDF6ueUf4S0awiiQp8F3b5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mP9AzoHRJme6lndaI+QCzmmJPBOHIG+QujkniaWK3a5BiNPmJ7LjOvc+PBwLtoWGP9U8AwX+mPCVKHQ1UtBmiGg+if1X2HhaVHTahX0WEN6BatkyhUEe03UN/hbpztOD233OUxTJ+RhpGVJAwXKsMloHfSE55n5uikNHNcGeSig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agEZLjOO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agEZLjOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8991F000FF;
	Sun, 20 Sep 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924147;
	bh=qKpwjWPW1NdYTtKIe6euaznppBojWulsRMGtxc9W8sQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=agEZLjOO1UxxCeMJBsjbPzFxZ4qapOmj56f2KgUJ2T2l4fekSQ3XeL3viZS4Rvisd
	 UbwRFs0x69Yz3jEXOyP9TIbCBYKcYCRSc/EL3WozZszVDOARO9c9noTqKLHHL25us4
	 QxMgqErtnirLM1azofAcvqvuviMqUs42TNexDtqQIjiez6o8gmfokxpYF7h9Grk5f1
	 0KbPZjK59bs6Vw4l4I2+TOy1fVHFkTVRAbhra/8ArtaWVUzohsI08tuNmXIX6SQ7y0
	 Y+RU44/Mw+TdfpxqxW7/a3pC8qxCQ5x/VOOgResK67UFQTQPbRn+oDmu/ZGtCpROr5
	 SsU777gEpuN3Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
Date: Sun, 20 Sep 2026 19:08:53 +0200
Message-ID: <178992412364.36366.8985404551240087001.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=399; i=krzk@kernel.org; h=from:subject:message-id; bh=XOrM/upLRY+Wl828g0o39pfuHUwJmLy7QyJxP738Xpo=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqsBMlxljmafkYVOSo0jGiQHvuG8WHTF19JAyb1 SIHRSj6S/uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCarATJQAKCRDBN2bmhouD 108QD/0YXteQAP3MUwMPRg7a7WlR91BSCRepj8sTrt+6oXgkM4+sAV5NUkjMgvWm1IZg+q+6mkI KmhZBOfuAKm3OcIexUAhKH0NN6MhNsEdq4RjWn/s5Yn7ngkbz16GO80alnwVi2hVR0qTJZu4L5F 4PmjACVfu8O85d0kJTyqcAIqQnJxG7KDGoeORP0zXt2Vt/4y/N+VtdxAuUrYzvSHso5k389fjX4 +s96ljMnS/kKsAVRfe1QiYAIah8sU9GAHtV3jnm7cqcjAvtgizh+BI6DA7jJQGZgODKHWxhkdD0 6UGN1iHcC9XUwcD/YfEP4HH7d5xgT1e5cDM4Pc20S4EqUnJIV/oAtwuViHFkPReUcPohQqpVQl3 FCEHMGPKjLmTS63RmjKtDFmfFO1+TUd5MRIdHuF+LjCjeBLQAbH74iQbe1icSlAgxPTFjR/UZF9 JeojR8X4LGUEcMbzFjE0ZQsZ/7T4K/jYn2NTvr9NzKp3QivEfofhwa3AkD16RwFblTUg4sAfUyU ia87eg914yncs62U9TuDXBHOCkn6bh+qWrf/Nm39v9TcbFOdhJHAwL/wbbBthxJcQwhR6lNI7R9 YwsDkjsH7i5t1NSkgIfAMTpptyaKNRVcs7H5MvKCLHp0HZ+NtA8m+fFsUwzZpHEhzAjSIvwlSVX 31jJu+5UmmD4x/
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 17:58:45 +0100, Alexey Klimov wrote:
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.

Applied, thanks!

[2/2] arm64: dts: exynos850: Add acpm SRAM node
      https://git.kernel.org/krzk/linux/c/089d44f32868e6a5fc3f817073b59b298fbc9e73

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

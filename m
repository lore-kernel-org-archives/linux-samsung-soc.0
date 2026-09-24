Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7883A1A23;
	Thu, 24 Sep 2026 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281178; cv=none; b=Voc6o872dzeByMsPS4biEmxYDk2faLIHnAMBsOXUFTxw41HWB3FAhc6KhbafwYd8m8kYGEBemKinzc+N3eEqqEaCWK3F64fK+2KEIEOqGoo0hSS1Glxcr6FaOyd3nfTNjBiCEEQ5kDQw9w7CXiPAC0ADo5I2pFla4zb1e5NoQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281178; c=relaxed/simple;
	bh=a6ETk4MvAX4zbOV5TGYE5HPHniXsdm5XjsPZyLOJ8b4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZsmHwVuxWxxxNuFH5c522KxU/23QY+82IaLS5sVmwn40VsnL1ulOzPncEqUkWBtuC5+F2xlqOrjEQEde/yVaEXLt7e3q9g8Qak8QwQY6O6KBfUIcwA3dYTFCG+A8tvY5UvVIbnzp+9HnmWFn18eDK//JZVKtljfeG7RcFfAvWkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aol5CJRJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aol5CJRJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5070B1F000FF;
	Thu, 24 Sep 2026 20:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790281174;
	bh=XlT6zjYynKmXd+lhEZPBZmKaApaIb7Mj9xPaX4dJNTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aol5CJRJUOPjv2DedekKsGHEioDBF0q5yA/09UyY1QbBsl4w4fvrcXWTnl8fOgaI2
	 V3z1fr2mrRRwtLcV07lf4ataUcxXxWpsw3zX1d0nRcDQel6C8JChK/u3ub1qPe8f2w
	 t15VYRXV2gtIHo5XtbiKXmmkUHwsvKe9mD0lavHrSJ3Mge80qJWo1j8oCkWATO2PFd
	 CxA+HYlPyBZn0EQnaoGa38tC9fxsnPY79UneJVp/uGTPuLxp3v2bOL7OqlqBfTDWGk
	 ZADrnTpTbMfJWs60PPqPcypzTF9kPiYnN6ggVs+cYHSn9zo1N7tlwcaKT+1jOBmpiz
	 ZhJv+W6FH87FQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919-max77759-charger-dts-v3-1-78b68fbf7d4a@google.com>
References: <20260919-max77759-charger-dts-v3-1-78b68fbf7d4a@google.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: gs101-pixel-common: add supply
 and regulator properties
Message-Id: <179028117091.127367.16717014077324931001.b4-ty@b4>
Date: Thu, 24 Sep 2026 22:19:30 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 19 Sep 2026 01:04:10 +0000, Amit Sunil Dhamne wrote:
> Add power supply and regulator properties to the MAX77759 pmic. The
> usb-typec device will reference the regulator provided by the pmic as
> it supplies vbus to the typec device when operating in source mode.
> 
> Additionally, describe the charging path as well. The pmic draws its
> input from the Type-C port and in turn charges the battery that the
> fuel gauge measures, which gives the full ladder:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add supply and regulator properties
      https://git.kernel.org/krzk/linux/c/3653ea2aa0a212677569a98cfccc183ba2c890cc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


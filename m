Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234613;
	b=sIbkYIJEfO4u7RWo+7/upDW3AxOg7N6rfxd2s7NbxKp/doTlFXuOvAY9h8ypWgITOa2T
	 Xrv2o7wB0GYFv4WUMj3TNuS3gdW9ul0bDiRTFfhn7Gq/UdXqnHfTLcYrwmhr9iPhvXzQW
	 VmyWI7GFeIhI2K4ySZx4lkEOSE/h6FNbr9jPKUENFgtBumVzlr2r9xkQNOVqeqyPD55fZ
	 3YurTSpwW5eMvVqa0azb5b0atjRkyM5YDbvYwjO9X7bcFF4991NIobldoyND/XP1V1uiw
	 w9j3mGDiKd+Qj52EdnNI/Ijq8OyhSDgrNxZZETho6niQTM66e1FmBcsT3IVuENnTZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234613;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=hLE7zIODsl5Dn1F3z+eZFGB0/u3q24th+XRZBDiUu3w=;
	b=eXhoei2N+iYUXbCQIaZ02CriH+jIr/2wyoLQ5oWJKYdlGuZzmE2fxjD4ySUzwIUfvnCm
	 sU/KdyPsR4gblnnlxPt6tNXytBX+/7S4mv9iV8LRzyP/SQ2Vmyt5sY8u44GBoBS2K5znR
	 rPAWwubSydwQlXpAy2guXPjjpHtT5y8frpgf81dd7hUlVWvX/NSGivoocBJp3Gmv5OAUb
	 Jr9L/3lnJfoerQnaXHimE8vSnCtVveU8XFSsdOvmizeMhzaRaGl44GAuYSgB6r/aZeLo/
	 zxxAekLOJTSYmWoN3fkUpnNGfhSwiNL0KxxiPGysgSC0x03Ztt9+WRJLxrFzQv3tZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NSFWTKFb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9818606A323;
	Mon,  9 Nov 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NSFWTKFb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08601F0089F;
	Mon,  9 Nov 2026 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234612;
	bh=hLE7zIODsl5Dn1F3z+eZFGB0/u3q24th+XRZBDiUu3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NSFWTKFbtkVnPZgIm7p1bxRv3wCfECzuvW31hmUQz1bVcZmeUdBAy/6SveeDBQ393
	 QvtccfH5T4gSYdYqZGQ2iLSLE0ic1blqo4ypapFPKVuOZs+EYeeVHsoF3gbo03ML7Z
	 1XzAg6es7+xTcUvthSmbIEMM9xjmrrgNr1NJnSLbmBJsCpMwl797BGEl0nYSKFTGhp
	 HsbrLHNGrYLG1KU5ppvJD1YxJvdJXwMHUryFzsGZs/AgkUIDZhQttH7FzfJxWg7b8r
	 dfwy5Lw8P034O1ImZ710nKZZ0wxsGjECvSIogKSMVTENhwzD33joPr4bVMh8MIZda3
	 E7dvJ/K2q+ngg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, peter.griffin@linaro.org, linusw@kernel.org, 
 Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 morbo@google.com, kees@kernel.org, justinstitt@google.com, 
 aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
In-Reply-To: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank
 names
Message-Id: <179423460743.181703.6000020720951856731.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:30:07 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sun, 27 Sep 2026 12:07:58 -0700, Mariia Nikitash wrote:
> samsung_banks_node_get() constructs each pin bank node name by copying
> bank->name with strscpy() and appending the suffix with strlcat().
> 
> In preparation for removing the deprecated strlcat() API[1], format the
> node name in a single snprintf() call, which preserves the existing
> truncation check against sizeof(node_name).
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Use snprintf() to construct pin bank names
      https://git.kernel.org/pinctrl/samsung/c/a47853cef90c0553457e690df693a6cc806a3849

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


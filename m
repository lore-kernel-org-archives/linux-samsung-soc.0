Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CCB358389;
	Thu, 21 May 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354413; cv=none; b=suAQR5vMJVU8uVh1XgPUJQXmfhoHW3yRXnSXsLt+QHKdK5hy7SMC1A82zxvWtUBhZujdtGVBpBsfDr1gOf1Bw1Hq6l9AIgIG4GtIIjp6ls0QhtmamE9+XDDWlh8q7agrrCpa/eRqPduZ4juPVyqhaiULmEXyGJNaNlnM+A2qb+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354413; c=relaxed/simple;
	bh=bG1ORrM+5zQuozEgvJPRr0FAsMaoGZ5vXZ0w82XrLeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IfwhfkmxNAd51ChCE5tj2ABj2fcairL93l6eZU3cA3yul2bc3An5m/B5cLOsKO5hnRbI6xqIPStIaYlirAwC2ltLHTZjSHAMvG04E0E2VjFBA8j7JZ8YCr7OKxo2Y+ACESUb6xjzpXrI3v+Hzw6vkjbhmGO8d1UBUvOrCidDf/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3mrLih5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3mrLih5"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BA0631F000E9;
	Thu, 21 May 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354412;
	bh=0chucKSxIxMImRF4ab1C0iTNacki3NqqCTkFos9OEuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P3mrLih5x0pu8nQDHtlwWUhxQawDZVLViB9rQFD0Ef2rlSxi+N8t6wELWONvcNgWn
	 Fp/cOL88m0R7Ejk328LMFt8oB71XJSjtLu6ksx27u9nIG8sTEvEinDuWt3tqsf+E7R
	 ccp7BZwXGvJk03Yf2yjKVk9U2k3BVldh1+O4Nu1e7RCaMYAoyk42kS125TyuMMI2cS
	 zdHlxe1Pk8FqoG0o2CKVuiCpvhRvL+S7pQJJ4oF5e9AeTL4KyinC21bZ/myf9ggfNd
	 eknFms+7oeD+w8fXrO+dfawz+hox6aUSuXQmCdai703ae5NTMb/awDlmTqdnKkFgzA
	 SE+hiwhsJZVcg==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
In-Reply-To: <20260520220422.3522908-1-m.szyprowski@samsung.com>
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
 <20260520220422.3522908-1-m.szyprowski@samsung.com>
Date: Thu, 21 May 2026 11:06:48 +0200
Message-ID: <87ecj5w2qf.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 21 2026 at 00:04, Marek Szyprowski wrote:

> The exynos-combiner driver uses a regular spinlock to protect access to
> the combiner interrupt status register in combiner_handle_cascade_irq(),
> which is invoked in hard IRQ context as a chained interrupt handler.
>
> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
> sleeping lock (mutex-based), which must not be used in atomic context
> such as hard interrupt handlers. Switch the irq_controller_lock to
> raw_spinlock, which remains a true non-sleeping spinlock even under
> PREEMPT_RT.

Mechanically this makes sense, but out of curiosity I have to ask:

> -static DEFINE_SPINLOCK(irq_controller_lock);
> +static DEFINE_RAW_SPINLOCK(irq_controller_lock);
>  
>  struct combiner_chip_data {
>  	unsigned int hwirq_offset;
> @@ -72,9 +72,9 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
>  
>  	chained_irq_enter(chip, desc);
>  
> -	spin_lock(&irq_controller_lock);
> +	raw_spin_lock(&irq_controller_lock);
>  	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
> -	spin_unlock(&irq_controller_lock);
> +	raw_spin_unlock(&irq_controller_lock);

What is this lock actually protecting?

Each combiner has it's own @base address, so there is no concurrency
problem between two cascade interrupts being handled at the same time.

That means the only possible problem would be that the same cascade
interrupt is handled on two CPUs concurrently. Is that even possible?

Thanks,

        tglx

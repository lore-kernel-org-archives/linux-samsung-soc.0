Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8912642AB9;
	Wed, 22 May 2024 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394820; cv=none; b=i4gPhFLOk0ePXPNQRl4xm4GZ6Ia8Gc6bOiwwPdHMyUue18yAgoVzvFla9DVii0Rryg8YkbVZ98/9FzPmNMtAFYCdBX5ruNrDemr475KQx8BqSKdTUmGf489+iwPtGOhtsnWY5/YK2YFJY1IKnRWaCdMvap1L41zhVDymx4kTTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394820; c=relaxed/simple;
	bh=Q0YYgomuZ7a/Ey+Ex03pRVCfua6lfh9KBm3qhFwLyAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F138G1rHXh7R9AJ4OwVKqCryeQyQRsRIDhiJ6dR/gp9iviAvi5rWnAYvIgfn68D+JLAoZAgZQUi8V+xtLl2mtQ9OIq+Ihxdow3wJcuRFuBewqnkYob7hwfDZ3AsEWt0MqymNJz9KTGDKdKms9e7k4v19xwRfvFikQb7dIVRqySc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUEAW0uv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUEAW0uv"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a621cb07d8fso155847566b.2;
        Wed, 22 May 2024 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716394817; x=1716999617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAmYmReX6PJbiPANH3CQQN4HAh3/OEfTwrGvBy42nz0=;
        b=DUEAW0uvAAX5PjhG/Et0QkkPybkUG27toqovsjAvwtT58rajcX7A1jX1lnfGqe3FQR
         SMGzilhMAUwdUPiiMTFeZHZh2B/uJ6kDedSx2owEFyU95+GlMiCY/UA1tF8TAzecOmGk
         ykqNduk5wFqOklf1GoKIN+rNZtG9b7JFDrBSDMbNDi80y5TPOL0UgCArKLa3+iIl/g0o
         Fh0iBKCB3aN6XoTEvGIjQYGwRRVnlp5JxwTAWExYl5grhISnLoJ+UGg06d3/YeSlxyfw
         ceW+r/3msIaI+LXEkWFZBx2f9KqdgaJ0wdB98S8JOiOwk910EN2675hmvC+LL9eFjO9S
         zxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394817; x=1716999617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rAmYmReX6PJbiPANH3CQQN4HAh3/OEfTwrGvBy42nz0=;
        b=Z40EKG/m+hgouVWOyf6bcmc5krbyvL6Fk8AqlI5HHYAFrMuG2YaBlAzyGryc4zSyVv
         RWjisFiXHcMDmFSx3vEVeEfpGiBOlek3AkOEqfKq76PxJ6Q345LEHUmubj+XJAqdRS0a
         2RCyIgUE6Gmltnpkb+yk5+SmQQcOkr97fEnuy94yYNkNIsLj2knfiVDR1R3FkCmdYuJw
         CGUqTPEQ7AUtFJ2CZNV4qSc+LckXVzswUMhjxITxv86AmgvSAeseQ11J3zgIykyPMvdJ
         CYL9PKEo5Zcqy3WD6tpPAPiMsj9KRkFbEr58iK5+bBuicaF+pzFokG0CmnAhBb9iusjd
         afSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTtvawIpH8HGtyoZl//rQiMc0Hn7RWjobVadQMxSvpN5+BNBtHroBFQ+c950jiFTgXLsyU5ZUcJ6YTCYC2s6bo+HcCSaTbuEqD7ZTU07KchTIuWt+q3WmfQpKvQUTjcrCZJPp8kV0XDotJE7JAQUCyLSAj5EJRZCbx7JKvP2AXc0ju3MYqa04I1fo0zx4kiKZcUR+cHc3QTGduAInXRktNzHNSpCNPnhg=
X-Gm-Message-State: AOJu0Yz2L7wmZcm7BPKH6A+b9zXTNp391JKZAFTpAmEgfEVc9psaenpH
	JKsrytl3YLtAfSa9U/+lSQhkn5YTZgJL8mpZSDjsE9i7BB0h3pOg
X-Google-Smtp-Source: AGHT+IHX16TQSndzssQgcqAzfbd1WNux9/z8SsMd1HxgJsKinbW/Bh1wbsuSCjyy29FD+JAs7+9gIQ==
X-Received: by 2002:a17:906:f80e:b0:a5c:f73d:67b3 with SMTP id a640c23a62f3a-a6228153fe5mr162987766b.63.1716394816651;
        Wed, 22 May 2024 09:20:16 -0700 (PDT)
Received: from [192.168.50.244] (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7dd4sm1798467266b.139.2024.05.22.09.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:20:16 -0700 (PDT)
Message-ID: <52428c0d-4b18-4707-9cda-4e6a11e256bc@gmail.com>
Date: Wed, 22 May 2024 18:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
 <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.2024 16:35, Mark Brown wrote:
> On Sun, May 19, 2024 at 10:17:49AM +0200, Artur Weber wrote:
> 
>> +static int midas_headset_mic_bias(struct snd_soc_dapm_widget *w,
>> +			     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_card *card = w->dapm->card;
>> +	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
>> +
>> +	if (!priv->reg_headset_mic_bias)
>> +		return 0;
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		return regulator_enable(priv->reg_headset_mic_bias);
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		return regulator_disable(priv->reg_headset_mic_bias);
>> +	}
> 
> We have SND_SOC_DAPM_REGULATOR_SUPPLY?

This is pretty much copied from the implementation of the mic bias
and sub mic bias regulator handling in the same driver; they all use
SND_SOC_DAPM_MIC combined with an enable/disable function like this one.

What would be the correct thing to do here - add a secondary DAPM widget
of type REGULATOR_SUPPLY and connect it to the MIC widget via audio-
routing, or replace the entire MIC widget with a REGULATOR_SUPPLY (or
something else entirely)?
And should this be done with the Main Mic and Sub Mic as well?

Best regards
Artur

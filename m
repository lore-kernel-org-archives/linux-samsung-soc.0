Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7231E570E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jan 2025 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248344; cv=none; b=ArYyuC0HnNxl1VSN4wKehDPmhdb7n/8SzZ44nc1kj/7nrYCApmWvt4dinC8IfHwLuvPSDsWtk+lsfZMD05SM6EI/qaSW9oVfJiB+DWLSBkzN6cISWH5fcL6EHxnNrdrr87qd8fi40QPDYxxdDqVQ8J7euPvSx2mAJXVmvhz/pEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248344; c=relaxed/simple;
	bh=joH8dqPFxMW8rMz1XO77xmtl/YHd4CcIpAtUzKZocZE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsG8xyKH+Wf7KrqR69qTkl7hj+kbeeZKJByYMffKJSBfVqati7wip9PSHnR6JiUnPKw4+XbLCHrGuzAehTfWfCpeUY+LsZie4YAzsSzSsQCAQl27xtPuSsgf5G4usOB8RxSJdpv2byd4tu9DvFWU0iSc7W3ac5bP+lCWeVjYL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1Od+lea; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1Od+lea"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283d48so111205345e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2025 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248338; x=1736853138; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=joH8dqPFxMW8rMz1XO77xmtl/YHd4CcIpAtUzKZocZE=;
        b=m1Od+leakSH+9UPe0na25nBiqlRcB80xbGTSr3s+cK1aLe+SH26x0S/HyEs3zL3PY1
         HSg5qPR7zKnJ3BMGxdKSZ5YD7LpZAuqWt7boKrn5xv+85VpfJFVauJQ7KvDfC9vBYKVy
         kcFC3mkI1s5kO97yFWLc1eNITLfuC+BQfFiN10KOgJ7xxGOuwrF6GggwqNWrbqC/hsn1
         a5xbDwMhmpvWUCUIBDu3tbNeQeyJMyvPYRV69w9WKCTh+KNyJJlLTVYcj+EKBUX4IDd1
         t6kwnIGm+Tongc4pRoOG6oqOKaBpdtNfLNoNNHTYyK7SpmrIWnOCw6m8JkjFXghhjEiC
         SZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248338; x=1736853138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joH8dqPFxMW8rMz1XO77xmtl/YHd4CcIpAtUzKZocZE=;
        b=Blll9/WBqWIezu1uPUJGE3t8orFzurz6XGm1DRN+qC8MSV5mxgGvdqTmx7PX/lhBo3
         3CK/zll3MwLSnd8yHl1oWQLyKLy/Bq7ABfeRBwEwMIBJ8D8EahtdEZVWmnYxMpj59W7n
         158GClyGTHWphhKASKurD5mATq3pTTWLVkKvS6AOAlG4ArbPBCyBatYQY8SXq7yphcRK
         nRl/WUKgvikfJGs9b84TQyp/ybAnYRjt/S0kwsKUjbIxUz/nMWr7Bi0tUn5dZBq80AuP
         4MqwDVxA7DliUbvtB1/TJQOY23jV2aEclWr0k/PQtx04LIpDFrT2hFpiyqtqxauJAUVT
         EkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQVUkzIWcqfqshTzoOR/IV224aKQlCINx+W62nNMI97uIfuqjnfvQ02Ktge8Id/WrBDEkU4TBmkkVIt6GBfORVaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9q3FtEQAn0y8rNll/95NhkD/CAXkPccRIIuC++YLCsEvWfmm
	9YIvB7lZ4Ctqu2G33X9sEKxp+JHFUnodGjXd+pPajl3m0MqRMTlVdj70+Kmr2Ko=
X-Gm-Gg: ASbGnctNXYNVRQyN6VenaOvZTOOJj2/lQhfXvC1fu3/P15HArH9EQgv4jcXAju93/Bi
	mAqwLL5dH7Jb1Bd0wWUbvLqI5rxKuJnYR8sawQ27n28m8KHsrWCmsmJp9tgfJR+qxVLtnIEpBIe
	8phEQTOYNrjq+/lp82+4rjjDsI2aYo6lIx+KuEOBZ1riEDKqusbb7y2U9PQYFJc18jFmc1TVklo
	FDgLYXWhKy5dLpmbopRxMJsNuc6b3irBcBopHTD0urTJtgzYffIyZ+ujGNc
X-Google-Smtp-Source: AGHT+IFpD683L/Xnq8uxEeqg9tsz3tz8lKlVXMa5R3Jx59Gslqaq2nNppeiA2Jql4f+qmKUXncptVw==
X-Received: by 2002:a05:600c:474d:b0:434:f623:9ff3 with SMTP id 5b1f17b1804b1-4366864616amr567908985e9.15.1736248338172;
        Tue, 07 Jan 2025 03:12:18 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847dabsm49540541f8f.59.2025.01.07.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:12:17 -0800 (PST)
Message-ID: <9bc7e48b51d056acbba83bb40dfe133b16decc44.camel@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: defconfig: enable Maxim max1720x driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 07 Jan 2025 11:12:16 +0000
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-3-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-3-87959abeb7ff@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-02 at 12:15 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> Enable the Maxim max1720x as it is used by the gs101-oriole
> (Google Pixel 6) board.
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


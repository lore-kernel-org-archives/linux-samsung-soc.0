From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 01/13] regulator: Fix DT node name checking in max8997-pmic
Date: Tue, 24 Apr 2012 15:57:58 -0700
Message-ID: <CAOesGMj9AT9MUdC+Dg_qFSgztZpqrxnM3TJb=8wby2PFa6+jzw@mail.gmail.com>
References: <1334256332-29867-1-git-send-email-k.lewandowsk@samsung.com>
	<1334256332-29867-2-git-send-email-k.lewandowsk@samsung.com>
	<20120424225614.GA14008@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120424225614.GA14008@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Apr 24, 2012 at 3:56 PM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
>
> On Thu, Apr 12, 2012 at 08:45:20PM +0200, Karol Lewandowski wrote:
>> Avoid hard lockup when someone provides non-supported regulator
>> name.
>>
>> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>
> What is this supposed to apply against?

D'oh, I didn't see the dependency in 0/13, nevermind.


-Olof

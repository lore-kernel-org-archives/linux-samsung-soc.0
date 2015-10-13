From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos5422-odroidxu3: use cd-gpio method to
 detect sd-card
Date: Tue, 13 Oct 2015 09:12:56 +0900
Message-ID: <561C4C88.2040004@samsung.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <561B3739.4040701@samsung.com> <561B3A83.6090607@samsung.com>
 <1111856990.2419183.1444661252893.JavaMail.yahoo@mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1111856990.2419183.1444661252893.JavaMail.yahoo@mail.yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <moon.linux@yahoo.com>, Jaehoon Chung <jh80.chung@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 12.10.2015 23:47, Anand Moon wrote:
>>
>> Anand,
>>
>> You essentially reverted here af6ad88acbd6 ("ARM: dts: Mux XMMCnDATA[0]
>> pad correctly for Exynos5420 boards"). Why? There is no explanation in
>> the commit message about this.
> 
> I don't remember to send the patch relevant to this. Hmm...
> Well, Is this patch really signed-off by me?
> 
> Best Regards,
> 
> Jaehoon Chung
>>
>> Best regards,
>> Krzysztof
>>
> 
>>
> 
> 
> Some how I don't receive these mail on my email id.
> 
> I have picked up these changes from tizen repository for OdroidXU3.
> I have tested with this changes to detect UHS-I micro cd cards.
> That's the reason for this email. 

... and you applied it blindly without looking at actual existing
contents and at previous commits.

That is not how patches from different repositories should be cherry picked.

Best regards,
Krzysztof

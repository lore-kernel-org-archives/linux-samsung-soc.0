From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 20 Oct 2015 17:27:58 +0900
Message-ID: <5625FB0E.2000109@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
 <1445255206-11148-7-git-send-email-pankaj.dubey@samsung.com>
 <56258683.7070204@samsung.com> <5625B92C.10505@samsung.com>
 <5625C07D.4030706@samsung.com> <014301d10b01$488873f0$d9995bd0$@samsung.com>
 <5625E3B9.8040707@samsung.com> <021201d10b0f$b273bf00$175b3d00$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <021201d10b0f$b273bf00$175b3d00$@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 20.10.2015 17:17, Pavel Fedin wrote:
>  Hello!
> 
>>>  Pin controller is needed in order to configure multi-functional pins correctly.
>>
>> Are there any obstacles for upstreaming it?
> 
>  I don't know. The last post on this topic is from March, 2015:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html. Patch 0003 has been acked-by, and nothing more since
> that.
>  Actually, only 0002 and 0003 of this series are needed for the pin controller. 0001 has been accepted
> (27284129522e7e2a5b89e80bd44ea3345f79c9e8).

I see that all objections were solved and I already reviewed all of the
patches. This was sent before I started collecting patches as
co-maintainer so all it is needed now is to rebase and resend with
collected tags.

I'll try to find them in my archives and apply.

Really, if you have anything waiting then just resend/ping. Things
changed since May this year :) .

Best regards,
Krzysztof

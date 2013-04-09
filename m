From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: Fix interrupt pending register offset of
 the EINT controller
Date: Tue, 09 Apr 2013 23:59:09 +0900
Message-ID: <51642CBD.6060803@samsung.com>
References: <1365450787-14473-1-git-send-email-s.nawrocki@samsung.com>
 <201304082225.43967.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201304082225.43967.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/09/13 05:25, Heiko St=FCbner wrote:
> Am Montag, 8. April 2013, 21:53:07 schrieb Sylwester Nawrocki:
>> The external pending interrupt register address (EINTPEND) offset is
>> 0xa8, not 0x08. Without this patch the external interrupts are not
>> properly acknowledged, which may lead to an interrupt storm and the
>> system hang as soon as any external interrupt is requested.
>>
>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> yep, I unintentionally introduced a typo there and the register really is
> 0xa8, so thanks (again) for the fix
>
> Reviewed-by: Heiko Stuebner<heiko@sntech.de>
>
Applied into fixes for v3.9.

Thanks.

- Kukjin

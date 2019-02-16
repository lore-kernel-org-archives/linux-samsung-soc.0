From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [Bug] s5p-sss crypto driver doesn't set next AES-CBC IV
Date: Sat, 16 Feb 2019 10:52:49 +0100
Message-ID: <CAJKOXPfU5JVU1Z9hBf-9cfDvaq3825su12jYv=Qf3K4nCQox=w@mail.gmail.com>
References: <20190215185058.GB12909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190215185058.GB12909@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Biggers <ebiggers@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Christoph Manszewski <c.manszewski@samsung.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-crypto@vger.kernel.org, Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 15 Feb 2019 at 19:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Hello,
>
> The AES-CBC implementation in the s5p-sss crypto driver is failing the improved
> crypto self-tests I currently have out for review.  The improved tests check
> that all CBC implementations update the IV buffer to be the last ciphertext
> block.  This has always been required so that requests can be chained, but
> unfortunately it wasn't tested for by the self-tests until now.
>
> See the boot logs for Exynos platforms from the KernelCI job here:
> https://kernelci.org/boot/all/job/ardb/branch/for-kernelci/kernel/v5.0-rc1-149-g64c945c018af/
>
> alg: skcipher: cbc-aes-s5p encryption test failed (wrong output IV) on test vector 0, cfg=\"in-place\"
> 00000000: 3d af ba 42 9d 9e b4 30 b4 22 da 80 2c 9f ac 41
>
> You can reproduce by pulling from
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> branch "iv-out-testing", unsetting CONFIG_CRYPTO_MANAGER_DISABLE_TESTS,
> setting CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y, rebooting and checking dmesg.
>
> (CRYPTO_MANAGER_EXTRA_TESTS is probably unneeded for this, but you might as well
> use it.  Also you can optionally revert the last patch, which makes crypto
> self-test failures cause a kernel panic for testing purposes.  It's possible
> that ctr-aes-s5p is failing too but it was just never gotten to...)
>
> The patch series is also available on the linux-crypto mailing list:
> https://patchwork.kernel.org/cover/10811951/
>
> Note that I don't have this hardware myself, so if it turns out that no one is
> interested in fixing this anytime soon I'll instead have to propose disabling
> these algorithm(s) until they can be fixed.

Thanks for the report. I'll take a look. I have the HW so I think I
will be able to reproduce it easily.

Best regards,
Krzysztof
